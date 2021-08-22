const functions = require('firebase-functions');

// constant
const stripe = require('stripe')(functions.config().stripe.testkey)

// firebase function
exports.stripePayment = functions.https.onRequest(async (req, res) => {

    const paymentIntent = await stripe.paymentIntents.create({
        // amount should be passed to the request - amount in cents
        amount: 1999,
        currency: 'usd'
    },
        function (err, paymentIntent) {
            if (err != null) {
                console.log(err)
            }
            else {
                res.json({
                    paymentIntent: paymentIntent.client_secret
                })
            }
        }
    )
})