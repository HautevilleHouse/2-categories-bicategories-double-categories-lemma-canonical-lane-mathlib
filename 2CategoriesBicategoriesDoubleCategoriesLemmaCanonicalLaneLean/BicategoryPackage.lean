import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  oneMorphisms : objects → objects → Type v
  twoMorphisms : ∀ {a b : objects}, oneMorphisms a b → oneMorphisms a b → Type w
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonAxiom : Prop
  triangleAxiom : Prop
  verticalComposition : Prop
  horizontalComposition : Prop
  interchangeLaw : Prop
  identityOneMorphisms : Prop
  identityTwoMorphisms : Prop

structure BicategoryEvidence (B : BicategoryPackage) where
  associatorClosed : B.associator
  leftUnitorClosed : B.leftUnitor
  rightUnitorClosed : B.rightUnitor
  pentagonAxiomClosed : B.pentagonAxiom
  triangleAxiomClosed : B.triangleAxiom
  verticalCompositionClosed : B.verticalComposition
  horizontalCompositionClosed : B.horizontalComposition
  interchangeLawClosed : B.interchangeLaw
  identityOneMorphismsClosed : B.identityOneMorphisms
  identityTwoMorphismsClosed : B.identityTwoMorphisms

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.associator ∧ B.leftUnitor ∧ B.rightUnitor ∧
  B.pentagonAxiom ∧ B.triangleAxiom ∧
  B.verticalComposition ∧ B.horizontalComposition ∧
  B.interchangeLaw ∧ B.identityOneMorphisms ∧
  B.identityTwoMorphisms

theorem bicategory_closed_from_evidence (B : BicategoryPackage)
    (E : BicategoryEvidence B) : BicategoryClosed B := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.pentagonAxiomClosed
          (And.intro E.triangleAxiomClosed
            (And.intro E.verticalCompositionClosed
              (And.intro E.horizontalCompositionClosed
                (And.intro E.interchangeLawClosed
                  (And.intro E.identityOneMorphismsClosed
                    E.identityTwoMorphismsClosed))))))))

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse