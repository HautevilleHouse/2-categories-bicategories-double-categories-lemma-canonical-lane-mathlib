import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure TwoCategoryPackage where
  objects : Type u
  oneMorphisms : objects → objects → Type v
  twoMorphisms : ∀ {a b : objects}, oneMorphisms a b → oneMorphisms a b → Type w
  verticalComposition : Prop
  horizontalComposition : Prop
  interchangeLaw : Prop
  identityOneMorphisms : Prop
  identityTwoMorphisms : Prop
  associativityOne : Prop
  associativityTwo : Prop
  unitLaws : Prop

structure TwoCategoryEvidence (C : TwoCategoryPackage) where
  verticalCompositionClosed : C.verticalComposition
  horizontalCompositionClosed : C.horizontalComposition
  interchangeLawClosed : C.interchangeLaw
  identityOneMorphismsClosed : C.identityOneMorphisms
  identityTwoMorphismsClosed : C.identityTwoMorphisms
  associativityOneClosed : C.associativityOne
  associativityTwoClosed : C.associativityTwo
  unitLawsClosed : C.unitLaws

def TwoCategoryClosed (C : TwoCategoryPackage) : Prop :=
  C.verticalComposition ∧ C.horizontalComposition ∧
  C.interchangeLaw ∧ C.identityOneMorphisms ∧
  C.identityTwoMorphisms ∧ C.associativityOne ∧
  C.associativityTwo ∧ C.unitLaws

theorem two_category_closed_from_evidence (C : TwoCategoryPackage)
    (E : TwoCategoryEvidence C) : TwoCategoryClosed C := by
  exact And.intro E.verticalCompositionClosed
    (And.intro E.horizontalCompositionClosed
      (And.intro E.interchangeLawClosed
        (And.intro E.identityOneMorphismsClosed
          (And.intro E.identityTwoMorphismsClosed
            (And.intro E.associativityOneClosed
              (And.intro E.associativityTwoClosed
                E.unitLawsClosed))))))

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse