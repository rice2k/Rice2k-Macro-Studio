"""
Rice2k Macro Studio v1.0 source loader.

The application source is stored in ordered UTF-8 fragments under src_fragments/.
The fragments are concatenated exactly and executed as one source module. This keeps
GitHub uploads manageable while preserving the validated application source byte-for-byte.
"""
from pathlib import Path
import sys


def _source_fragment_dir():
    base = Path(getattr(sys, "_MEIPASS", Path(__file__).resolve().parent))
    return base / "src_fragments"


def _run_application_source():
    parts_dir = _source_fragment_dir()
    parts = sorted(parts_dir.glob("part_*.pyfrag"))
    if not parts:
        raise FileNotFoundError(
            f"Rice2k Macro Studio source fragments were not found in: {parts_dir}"
        )
    source = "".join(p.read_text(encoding="utf-8") for p in parts)
    exec(compile(source, str(parts_dir / "rice2k_macro_studio_full.py"), "exec"), globals(), globals())


_run_application_source()
