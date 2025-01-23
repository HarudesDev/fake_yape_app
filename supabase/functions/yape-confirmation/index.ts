import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'

interface Yapeo {
  id: int
  receiver_id: int
  sender_id: int
  yapeo_date: timestamp
  yapeo_amount: number
  message: null | string
}

interface WebhookPayload {
  type: 'INSERT'
  table: string
  record: Yapeo
  schema: 'public',
  old_record: null | Yapeo
}

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
);

Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json()

  const receiverData = await supabase.from('users').select('fcm_token').eq('id', payload.record.receiver_id).single()

  const senderData = await supabase.from('users').select('fullname').eq('id', payload.record.sender_id).single()

  const fcmToken = receiverData.data.fcm_token as string

  const senderName = senderData.data.fullname as string

  const { default: serviceAccount } = await import('../service-account.json', {
    with: { type: 'json' },
  })

  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  })

  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          notification: {
            title: 'Confirmación de Pago',
            body: `Yape! ${senderName} te envió un pago por S\/ ${payload.record.yapeo_amount}`
          },
        },
      }),
    }
  )

  const resData = await res.json()
  if (res.status < 200 || res.status > 299) {
    throw resData

  }

  return new Response(
    JSON.stringify(resData),
    { headers: { "Content-Type": "application/json" } },
  )
})


const getAccessToken = ({ clientEmail, privateKey }: { clientEmail: string, privateKey: string }): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    })
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err)
        return;
      }
      resolve(tokens!.access_token!)
    })
  })
}