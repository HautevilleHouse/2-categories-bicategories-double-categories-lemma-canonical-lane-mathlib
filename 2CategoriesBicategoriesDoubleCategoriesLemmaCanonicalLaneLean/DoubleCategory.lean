import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean.Bicategory

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure DoubleCategory where
  Obj : Type u
  Hor : Obj → Obj → Type v
  Ver : Obj → Obj → Type w
  Square : ∀ {a b c d : Obj}, Hor a b → Ver b d → Ver a c → Hor c d → Type x
  idHor : ∀ (a : Obj), Hor a a
  idVer : ∀ (a : Obj), Ver a a
  compHor : ∀ {a b c : Obj}, Hor a b → Hor b c → Hor a c
  compVer : ∀ {a b c : Obj}, Ver a b → Ver b c → Ver a c
  idSquare : ∀ (a : Obj), Square (idHor a) (idVer a) (idVer a) (idHor a)
  vertCompSquare : ∀ {a b c d e f : Obj} {h : Hor a b} {v1 : Ver b d} {v2 : Ver a c} {h' : Hor c d}
    {h'' : Hor e f} {v3 : Ver d f} {v4 : Ver c e},
    Square h v1 v2 h' → Square h' v3 v4 h'' → Square h (compVer v1 v3) (compVer v2 v4) h''
  horizCompSquare : ∀ {a b c d e f : Obj} {h1 : Hor a b} {v1 : Ver b d} {v2 : Ver a c} {h2 : Hor c d}
    {h3 : Hor e f} {v3 : Ver d f} {v4 : Ver c e},
    Square h1 v1 v2 h2 → Square h2 v3 v4 h3 → Square (compHor h1 h2) v1 v4 h3
  interchangeLaw : ∀ {a b c d e f g h : Obj} {h1 : Hor a b} {h2 : Hor b c} {h3 : Hor c d}
    {v1 : Ver b e} {v2 : Ver e f} {v3 : Ver f g} {v4 : Ver a h} {v5 : Ver h i} {v6 : Ver i j}
    {h4 : Hor d j} {h5 : Hor g h} {h6 : Hor f g} -- simplified
    (s : Square h1 v1 v4 h5) (t : Square h2 v2 v5 h6) (u : Square h3 v3 v6 h4),
    vertCompSquare (horizCompSquare s t) u = horizCompSquare (vertCompSquare s t) u

def DoubleCategoryClosed (D : DoubleCategory) : Prop :=
  D.interchangeLaw

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse
