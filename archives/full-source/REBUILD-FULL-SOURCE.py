from pathlib import Path
import base64, hashlib, sys

root = Path(__file__).resolve().parent
parts = sorted((root / "parts").glob("part-*.b64"))
if len(parts) != 76:
    print(f"RESULTADO=ERROR_PARTS ({len(parts)}/76)")
    sys.exit(1)

encoded = "".join(p.read_text(encoding="ascii").strip() for p in parts)
data = base64.b64decode(encoded)
out = root / "PrivilegeFans-FULL-SOURCE-v32.10-RC7.zip"
out.write_bytes(data)

sha = hashlib.sha256(data).hexdigest()
expected = "a77d46135729b72de24effe4d837868bc3f5a76bd01bfdc468e10115a635637b"
print(f"PARTS={len(parts)}")
print(f"SIZE={len(data)}")
print(f"SHA256={sha}")
if sha != expected:
    print("RESULTADO=ERROR_SHA")
    sys.exit(1)
print("RESULTADO=OK")
print(out)
