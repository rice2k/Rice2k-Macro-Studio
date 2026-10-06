from __future__ import annotations

from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent
SOURCE = ROOT / "rice2k_macro_studio.png"
BUILD_DIR = ROOT / ".build_assets"
BUILD_PNG = BUILD_DIR / "rice2k_macro_studio.png"
BUILD_ICO = BUILD_DIR / "rice2k_macro_studio.ico"

BUILD_DIR.mkdir(parents=True, exist_ok=True)

def load_source() -> tuple[Image.Image, str]:
    try:
        with Image.open(SOURCE) as src:
            src.load()
            image = src.convert("RGBA")
        return image, f"Using validated source image: {SOURCE.name}"
    except Exception as exc:
        image = Image.new("RGBA", (256, 256), (8, 17, 31, 255))
        draw = ImageDraw.Draw(image)
        draw.rounded_rectangle((18, 18, 238, 238), radius=44, fill=(16, 36, 58, 255), outline=(23, 139, 255, 255), width=8)
        draw.ellipse((58, 58, 198, 198), fill=(23, 139, 255, 255))
        draw.ellipse((78, 78, 178, 178), fill=(8, 17, 31, 255))
        draw.line((80, 176, 176, 80), fill=(57, 212, 196, 255), width=18)
        return image, f"WARNING: {SOURCE.name} is unreadable ({type(exc).__name__}: {exc}). Generated a safe fallback build image."

image, status = load_source()
print(status)

# Normalize to a square RGBA image so both PNG and ICO are guaranteed valid.
side = max(image.size)
canvas = Image.new("RGBA", (side, side), (0, 0, 0, 0))
canvas.alpha_composite(image, ((side - image.width) // 2, (side - image.height) // 2))
canvas.thumbnail((256, 256), Image.Resampling.LANCZOS)

final = Image.new("RGBA", (256, 256), (0, 0, 0, 0))
final.alpha_composite(canvas, ((256 - canvas.width) // 2, (256 - canvas.height) // 2))

final.save(BUILD_PNG, format="PNG", optimize=True)
final.save(
    BUILD_ICO,
    format="ICO",
    sizes=[(16, 16), (24, 24), (32, 32), (48, 48), (64, 64), (128, 128), (256, 256)],
)

# Re-open both outputs so the build never continues with a damaged generated asset.
with Image.open(BUILD_PNG) as check_png:
    check_png.verify()
with Image.open(BUILD_ICO) as check_ico:
    check_ico.verify()

print(f"Prepared build PNG: {BUILD_PNG}")
print(f"Prepared build ICO: {BUILD_ICO}")
