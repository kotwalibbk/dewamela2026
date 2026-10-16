देवा मेला इंटेलिजेंस ऐप — ऑनलाइन-ready संस्करण V4

महत्वपूर्ण: यह पैकेज ऑनलाइन सेवा से जोड़ने के लिए तैयार किया गया है, लेकिन किसी बाहरी सर्वर पर अभी deploy नहीं किया गया है। सर्वर/खाता उपयोगकर्ता के अपने खाते में बनना होगा।

फ्री होस्टिंग के विकल्प:
- Netlify Free या Cloudflare Pages Free: HTML/CSS/JS वेबसाइट होस्ट करने के लिए।
- Supabase Free: PostgreSQL डेटाबेस और Auth के लिए (मौजूदा प्लान/सीमाएँ जाँचें)।

ऑनलाइन सेटअप:
1. Supabase पर नया प्रोजेक्ट बनाएँ।
2. SQL Editor खोलें और supabase_schema.sql की पूरी सामग्री चलाएँ।
3. Authentication → Users में अधिकृत उपयोगकर्ता बनाएँ। ईमेल confirmation की सेटिंग अपनी जरूरत के अनुसार रखें।
4. Project Settings → API से Project URL और anon/publishable key कॉपी करें।
5. config.js खोलकर SUPABASE_URL और SUPABASE_ANON_KEY में मान भरें। service_role/secret key कभी भी फ्रंटएंड में न डालें।
6. सभी फाइलें Netlify/Cloudflare Pages पर static site के रूप में deploy करें।
7. प्रकाशित HTTPS URL खोलकर अधिकृत Supabase ईमेल/पासवर्ड से लॉगिन करें।

डेटा:
- ऑनलाइन मोड में रिकॉर्ड Supabase app_records तालिका में सेव होते हैं।
- बिना कॉन्फ़िगरेशन के डेटा केवल उसी ब्राउज़र के Local Storage में रहता है।
- वर्तमान SQL policy किसी भी authenticated user को साझा रिकॉर्ड पढ़ने/बदलने देती है। सार्वजनिक या संवेदनशील तैनाती के लिए यह पर्याप्त सुरक्षित नहीं है; विभागीय IT विशेषज्ञ से भूमिका-आधारित RLS policies, audit trail और access restrictions बनवाएँ।
- सभी रिकॉर्ड एक बार में सिंक होते हैं; एक साथ कई लोगों द्वारा संपादन के लिए production-grade conflict resolution नहीं है।

सुरक्षा/अनुपालन:
यह पुलिस/खुफिया उपयोग के लिए प्रमाणित या production-secure प्रणाली नहीं है। वास्तविक संवेदनशील जानकारी, व्यक्तिगत डेटा, ऑपरेशनल ड्यूटी या गोपनीय संपर्क डालने से पहले विभागीय IT/साइबर सुरक्षा अनुमोदन लें। यदि अनुमति न हो तो synthetic/demo data ही रखें।
