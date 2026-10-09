"""Static scientific-color contract for the authored A3 resilience poster.

This does not certify the model's viability claims; it prevents decorative
styles and forbidden amber from re-entering its vector source/output.
"""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parent

class PosterColorTests(unittest.TestCase):
    def test_generator_and_output_are_gradient_free(self):
        for name in ("generate_poster.py", "poster-a3.svg"):
            text = (ROOT / name).read_text(encoding="utf-8")
            for word in ("linearGradient", "radialGradient", "#FFD400", "#F2B705", "#8A4B00"):
                with self.subTest(file=name, color=word):
                    self.assertNotIn(word, text)

    def test_figure_white_interiors_and_retained_labels(self):
        svg = (ROOT / "poster-a3.svg").read_text(encoding="utf-8")
        import re
        fills = re.findall(r'<ellipse\b[^>]*\bfill="([^"]+)"', svg)
        self.assertEqual(len(fills), 13)
        self.assertTrue(all(c.lower() in ("white", "#ffffff") for c in fills))
        for name in ("Sustain", "Adapt", "Absorb", "Recover", "Viable", "Critical Boundary", "Overload", "Degrade", "Cascade", "Collapse"):
            self.assertIn(">"+name+"<", svg)

if __name__ == "__main__":
    unittest.main()
