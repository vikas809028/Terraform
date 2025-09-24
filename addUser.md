# EC2 User Setup Notes (AWS Ubuntu 24.04)

## Instance Details

- **OS:** Ubuntu 24.04 LTS  
- **Default user:** `ubuntu` (key-based login with `terraform-key.pem`)  
- **Custom user:** `vikas` (password-based login)

---

## Steps Performed

### 1. Create New User

```bash
sudo adduser vikas
sudo usermod -aG sudo vikas
sudo passwd vikas
```

### 2. Enable Password Authentication

Edit SSH configuration files:

- `/etc/ssh/sshd_config`
- `/etc/ssh/sshd_config.d/60-cloudimg-settings.conf`

Set the following option in both files:

```conf
PasswordAuthentication yes
```

Restart the SSH service:

```bash
sudo systemctl restart ssh
```

### 3. Test Login

From your local machine:

```powershell
ssh vikas@<public-ip>
```

✅ Successfully logged in with password.

---

## Current Login Methods

- **ubuntu:** key-based login (`terraform-key.pem`)
- **vikas:** password-based login

---

## Security Notes

- Use a strong password for `vikas`.
- Restrict SSH access in your Security Group to your IP (not `0.0.0.0/0`).
- For better security, consider disabling password login after setup:

```conf
PasswordAuthentication no
```