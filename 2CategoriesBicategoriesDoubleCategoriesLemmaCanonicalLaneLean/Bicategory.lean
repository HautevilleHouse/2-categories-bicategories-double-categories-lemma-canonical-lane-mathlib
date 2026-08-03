import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean.TwoCategory

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure Bicategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  TwoHom : ∀ {a b : Obj}, Hom a b → Hom a b → Type w
  id : ∀ (a : Obj), Hom a a
  comp : ∀ {a b c : Obj}, Hom a b → Hom b c → Hom a c
  idTwoHom : ∀ {a b : Obj} (f : Hom a b), TwoHom f f
  vertComp : ∀ {a b : Obj} {f g h : Hom a b}, TwoHom f g → TwoHom g h → TwoHom f h
  horizComp : ∀ {a b c : Obj} {f g : Hom a b} {h k : Hom b c}, TwoHom f g → TwoHom h k → TwoHom (comp f h) (comp g k)
  associator : ∀ {a b c d : Obj} (f : Hom a b) (g : Hom b c) (h : Hom c d), TwoHom (comp (comp f g) h) (comp f (comp g h))
  leftUnitor : ∀ {a b : Obj} (f : Hom a b), TwoHom (comp (id a) f) f
  rightUnitor : ∀ {a b : Obj} (f : Hom a b), TwoHom (comp f (id b)) f
  triangleLaw : ∀ {a b c : Obj} (f : Hom a b) (g : Hom b c),
    horizComp (rightUnitor f) (idTwoHom g) = horizComp (idTwoHom f) (leftUnitor g) ∘ₕ associator f (id b) g
  pentagonLaw : ∀ {a b c d e : Obj} (f : Hom a b) (g : Hom b c) (h : Hom c d) (k : Hom d e),
    (associator f g (comp h k)) ∘ₕ (associator (comp f g) h k) =
    (idTwoHom f) ∘ₕ (associator g h k) ∘ₕ (associator f (comp g h) k) ∘ₕ (associator f g h) -- simplified

structure BicategoryEvidence (B : Bicategory) where
  triangleLawClosed : B.triangleLaw
  pentagonLawClosed : B.pentagonLaw

def BicategoryClosed (B : Bicategory) : Prop :=
  B.triangleLaw ∧ B.pentagonLaw

theorem bicategory_closed_from_evidence (B : Bicategory) (E : BicategoryEvidence B) : BicategoryClosed B :=
  And.intro E.triangleLawClosed E.pentagonLawClosed

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse
