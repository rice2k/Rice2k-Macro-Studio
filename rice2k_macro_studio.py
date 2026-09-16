"""
Rice2k Macro Studio v1.4.1 source loader.

The validated base application source remains in ordered fragments under src_fragments/.
Version patches under src_patches/ are inserted in filename order immediately before
main() is invoked.

Release patch lineage:
- v1.1 website recording filters
- v1.2 compact scrolling and state-safe styling
- v1.3 mockup-matched shell and Dashboard
- v1.4.1 theme polish, Neo Green, compact cleanup, and centered page layouts
"""
from pathlib import Path
import sys

EXPECTED_FRAGMENT_COUNT = 14


def _base_dir():
    return Path(getattr(sys, "_MEIPASS", Path(__file__).resolve().parent))


def _run_application_source():
    base = _base_dir()
    parts_dir = base / "src_fragments"
    patches_dir = base / "src_patches"

    parts = sorted(parts_dir.glob("part_*.pyfrag"))
    if len(parts) != EXPECTED_FRAGMENT_COUNT:
        raise FileNotFoundError(
            f"Rice2k Macro Studio expected {EXPECTED_FRAGMENT_COUNT} source fragments in "
            f"{parts_dir}, but found {len(parts)}."
        )

    source = "".join(p.read_text(encoding="utf-8") for p in parts)
    marker = '\nif __name__ == "__main__":\n    main()'
    if marker not in source:
        raise RuntimeError("Rice2k Macro Studio main() marker was not found in reconstructed source.")

    patches = sorted(patches_dir.glob("*.pyfrag")) if patches_dir.exists() else []
    if patches:
        patch_text = "\n\n".join(p.read_text(encoding="utf-8") for p in patches)
        source = source.replace(marker, "\n\n" + patch_text + "\n\n" + marker, 1)

    exec(
        compile(source, str(parts_dir / "rice2k_macro_studio_full.py"), "exec"),
        globals(),
        globals(),
    )


_run_application_source()
