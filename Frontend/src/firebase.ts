// Import the functions you need from the SDKs you need
import { FirebaseOptions, initializeApp } from "firebase/app"
import { getAuth } from "firebase/auth"
import { getAnalytics } from "firebase/analytics"

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries
// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional

const firebaseConfig: FirebaseOptions = {
  apiKey: "AIzaSyDS9qv6WXeoo2rdwjqQIu-6qeJV63vmQO0",
  authDomain: "sejmet-api.firebaseapp.com",
  projectId: "sejmet-api",
  storageBucket: "sejmet-api.appspot.com",
  messagingSenderId: "545627429838",
  appId: "1:545627429838:web:7675f1ec86d4162ba4e99f",
  measurementId: "G-WZSP6B7W5L",
}

// Initialize Firebase
const app = initializeApp(firebaseConfig)
export const auth = getAuth(app)
export const analytics = getAnalytics(app)
