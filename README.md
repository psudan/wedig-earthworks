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

Commit your changes, then:

```bash
./deploy.sh
```

This pushes to GitHub, has the server pull the new commit, and runs the cPanel
deployment in `.cpanel.yml` (copies `site/` into `/home/wedigear/public_html/`).

Without SSH, the same can be done by hand: `git push`, then cPanel →
Git™ Version Control → wedig-earthworks → **Manage** → **Pull or Deploy** →
**Update from Remote**, then **Deploy HEAD Commit**.

The deploy only adds and overwrites files; it never deletes. To remove a file
from the live site, delete it from `public_html` too.

## Hosting

- Host: domains.co.za, cPanel account `wedigear`, server 169.239.218.80
- SSH: port 22000, key `~/.ssh/id_ed25519_wedig`, alias `ssh wedig`
- Repo on server: `~/repositories/wedig-earthworks` (cloned from GitHub)
- Keep `public_html/google5c7a764c25c9d187.html` (Google site verification).
- Do not publish from Domains SiteBuilder: it writes an `index.php` that
  takes priority over `index.html`.
- Backup of `public_html` before the first Git deploy:
  `~/backups/public_html-2026-11-16.tgz` on the server.
