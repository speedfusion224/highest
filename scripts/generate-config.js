const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');

dotenv.config({ path: path.resolve(__dirname, '..', '.env') });

const config = {
  SUPABASE_URL: process.env.SUPABASE_URL || 'https://your-supabase-url.supabase.co',
  SUPABASE_ANON_KEY: process.env.SUPABASE_ANON_KEY || 'your-supabase-anon-key',
  SUPABASE_SERVICE_KEY: process.env.SUPABASE_SERVICE_KEY || 'your-supabase-service-key',
  PAYSTACK_PUBLIC_KEY: process.env.PAYSTACK_PUBLIC_KEY || 'your-paystack-public-key',
  PAYSTACK_SECRET_KEY: process.env.PAYSTACK_SECRET_KEY || 'your-paystack-secret-key',
  PAYSTACK_BASE_URL: process.env.PAYSTACK_BASE_URL || 'https://api.paystack.co',
};

const configContent = `window.APP_CONFIG = ${JSON.stringify(config, null, 2)};\n`;
const outputPath = path.join(__dirname, '..', 'src', 'config.js');

fs.writeFileSync(outputPath, configContent);
console.log(`Generated config at ${outputPath}`);
