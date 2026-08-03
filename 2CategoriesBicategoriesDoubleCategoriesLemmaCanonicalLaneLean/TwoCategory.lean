import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure TwoCategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  TwoHom : ∀ {a b : Obj}, Hom a b → Hom a b → Type w
  id : ∀ (a : Obj), Hom a a
  comp : ∀ {a b c : Obj}, Hom a b → Hom b c → Hom a c
  idTwoHom : ∀ {a b : Obj} (f : Hom a b), TwoHom f f
  vertComp : ∀ {a b : Obj} {f g h : Hom a b}, TwoHom f g → TwoHom g h → TwoHom f h
  horizComp : ∀ {a b c : Obj} {f g : Hom a b} {h k : Hom b c}, TwoHom f g → TwoHom h k → TwoHom (comp f h) (comp g k)
  idLaw : ∀ {a b : Obj} (f : Hom a b), comp (id a) f = f ∧ comp f (id b) = f
  assocLaw : ∀ {a b c d : Obj} (f : Hom a b) (g : Hom b c) (h : Hom c d), comp (comp f g) h = comp f (comp g h)
  twoIdLaw : ∀ {a b : Obj} (f : Hom a b), vertComp (idTwoHom f) (idTwoHom f) = idTwoHom f
  twoAssoc : ∀ {a b : Obj} {f g h i : Hom a b} (α : TwoHom f g) (β : TwoHom g h) (γ : TwoHom h i),
    vertComp (vertComp α β) γ = vertComp α (vertComp β γ)

def TwoCategoryClosed (C : TwoCategory) : Prop :=
  C.idLaw ∧ C.assocLaw ∧ C.twoIdLaw ∧ C.twoAssoc

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse
