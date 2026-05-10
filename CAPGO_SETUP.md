# Capgo CLI Setup Guide - TestFlight Deployment

## 📋 Project Configuration

- **App ID**: com.highestwas.app
- **Apple ID**: kobbyspeed@gmail.com
- **Team ID**: 57UCKCV8XK
- **Signing**: Automatic (Capgo handles)

---

## ✅ Prerequisites Checklist

- [ ] Capgo CLI installed: `npm install -g @capgo/cli`
- [ ] Capgo account created: https://capgo.app
- [ ] Apple Developer Account active
- [ ] App Store Connect account set up
- [ ] Apple Team ID available: `57UCKCV8XK`
- [ ] P8 API Key downloaded from App Store Connect

---

## 🔑 Getting Your Credentials

### 1. **Capgo API Token**

1. Go to: https://web.capgo.app/dashboard/settings/api
2. Generate a new API token
3. Copy and save it securely

### 2. **Apple App Store Connect API Key (P8 File)** ⚠️ IMPORTANT

This is the correct way to authenticate Capgo with Apple:

**Steps to Generate & Download:**
1. Go to: https://appstoreconnect.apple.com
2. Sign in with your Apple ID (`kobbyspeed@gmail.com`)
3. Click **Users and Access** in top menu
4. Click the **Keys** tab
5. Under "App Store Connect API", click the **+** button
6. Give it a name: "Capgo CLI"
7. Click **Generate**
8. Click **Download API Key** - saves as a `.p8` file
9. **⚠️ Important:** Apple only shows it once! Download immediately and save securely

**You'll need:**
- **Key ID**: Shows in App Store Connect after generation
- **Issuer ID**: Shows in App Store Connect after generation  
- **P8 File**: The downloaded private key file

### 3. **Certificate & Provisioning Profile**

Capgo will automatically:
- ✅ Request certificates from Apple
- ✅ Create provisioning profiles
- ✅ Handle code signing
- ✅ Manage the build process

---

## 🚀 Deployment Steps
Download P8 Key from App Store Connect
- Go to App Store Connect > Users and Access > Keys
- Click **+** under "App Store Connect API"
- Generate key & **Download immediately** (one-time download!)
- Save the `.p8` file to your project root as `auth_key.p8`

### Step 2: Create `.env` file
```bash
cp .env.example .env
```

Then edit `.env` and add:
```
CAPGO_TOKEN=your_capgo_api_token
APPLE_API3: Make script executable
```bash
chmod +x capgo-deploy.sh
```

### Step 4SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx
```

### Step 2: Make script executable
```bash
chmod +x capgo-deploy.sh
```

### Step 3: Build and deploy
```bash
./capgo-deploy.sh
```

Or manually run commands:
```bash
# Build your web app first
npm run build

# Login to Capgo
capgo login

# Create app in Capgo
capgo app create

# Build iOS release
capgo build --platform ios --build-type release

# Upload to TestFlight
capgo upload --channel production
```

---

## 📊 Monitoring

After deployment:
1. **Capgo Dashboard**: https://web.capgo.app/dashboard
2. **App Store Connect**: https://appstoreconnect.apple.com
3. **TestFlight Builds**: Check your TestFlight builds tab

---

## 🔍 Troubleshooting

### Build Fails Without Clear Error
```bash
capgo build --platform ios --build-type release --verbose
```

### Certificate Issues
- Capgo automatically handles certificates
- If issues persist, check App Store Connect > Certificates, Identifiers & Profiles

### TestFlight Upload Stuck
- Check app review status in App Store Connect
- Ensure IPA passes validation
- Review Capgo build logs

### Authentication Errors
```bash
# Re-authenticate
capgo logout
capgo login
```

---

## 📝 File Structure

```
highest/
├── capgo.config.json       # Capgo configuration
├── capgo-deploy.sh         # Automated deployment script
├── .env.example            # Environment variables template
├── .env                    # ⚠️ Local only, never commit
└── CNever** commit `auth_key.p8` to Git (already in `.gitignore`)
3. **Backup** your P8 file securely (Apple only shows it once!)
4. **Rotate** your API keys periodically in App Store Connect
5. Use **GitHub Secrets** if using CI/CD
6--

## 🔐 Security Best Practices

1. **Never** commit `.env` to Git (already in `.gitignore`)
2. **Rotate** your App-Specific Password periodically
3. **Backup** your Capgo API token securely
4. Use **GitHub Secrets** if using CI/CD
5. Limit **Team Member** access in App Store Connect

---

## 📞 Support

- **Capgo Docs**: https://capgo.app/docs
- **Capgo GitHub**: https://github.com/Cap-go/capgo
- **Apple Support**: https://developer.apple.com/support

---

## ✨ Next Steps

1. Generate your App-Specific Password
2. Create `.env` file with credentials
3. Run `./capgo-deploy.sh`
4. Monitor build in Capgo dashboard
5. Distribute to TestFlight testers
