/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

// Removed unused imports
const functions = require("firebase-functions");
const axios = require("axios");
const cors = require("cors")({origin: "https://travelstay247.co.uk"}); // Fixed quotes

exports.proxy = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    const apiUrl = `https://travelstay247.co.uk/hotel/api${req.url.replace("/api", "")}`;
    try {
      const response = await axios({
        method: req.method,
        url: apiUrl,
        data: req.body,
        headers: req.headers,
      });
      res.status(response.status).send(response.data);
    } catch (error) {
      console.error("Error while proxying request:", error); // Fixed quotes
      res.status(500).send("Error proxying request"); // Fixed quotes
    }
  });
});
