# WeDig Earthworks website

Website for WeDig Earthworks (Pty) Ltd — https://wedigearthworks.co.za

## Folders

| Folder | What it holds | Deployed? |
|---|---|---|
| `site/` | The live website (HTML, images) | Yes — copied to `public_html` |
| `brand/` | Logo SVGs and original photos | No |
| `_archive/old-site/` | Snapshot of the first site, 16 Nov 2026 | No |

## Preview locally

```bash
python3 -m http.server 8000 --directory site
```

Then open http://localhost:8000

## Deploy

1. Commit and push to GitHub: `git push`
2. In cPanel → Git™ Version Control → this repo → **Manage** → **Pull or Deploy**:
   **Update from Remote**, then **Deploy HEAD Commit**.

Deployment is defined in `.cpanel.yml` (copies `site/` into `/home/wedigear/public_html/`).

## Hosting

- Host: domains.co.za, cPanel account `wedigear`, server 169.239.218.80
- SSH from outside is currently blocked, so deploys go via GitHub.
- `public_html/index.php` (SiteBuilder placeholder) must be removed, or it
  takes priority over `index.html`.
