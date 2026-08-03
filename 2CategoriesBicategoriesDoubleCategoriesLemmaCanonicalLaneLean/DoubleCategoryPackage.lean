import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure DoubleCategoryPackage where
  objects : Type u
  horizontalMorphisms : objects → objects → Type v
  verticalMorphisms : objects → objects → Type w
  squares : ∀ {a b c d : objects}, horizontalMorphisms a b → verticalMorphisms a c → verticalMorphisms b d → horizontalMorphisms c d → Type x
  horizontalComposition : Prop
  verticalComposition : Prop
  horizontalIdentity : Prop
  verticalIdentity : Prop
  interchangeLaw : Prop
  associativityHorizontal : Prop
  associativityVertical : Prop
  unitLawsHorizontal : Prop
  unitLawsVertical : Prop

structure DoubleCategoryEvidence (D : DoubleCategoryPackage) where
  horizontalCompositionClosed : D.horizontalComposition
  verticalCompositionClosed : D.verticalComposition
  horizontalIdentityClosed : D.horizontalIdentity
  verticalIdentityClosed : D.verticalIdentity
  interchangeLawClosed : D.interchangeLaw
  associativityHorizontalClosed : D.associativityHorizontal
  associativityVerticalClosed : D.associativityVertical
  unitLawsHorizontalClosed : D.unitLawsHorizontal
  unitLawsVerticalClosed : D.unitLawsVertical

def DoubleCategoryClosed (D : DoubleCategoryPackage) : Prop :=
  D.horizontalComposition ∧ D.verticalComposition ∧
  D.horizontalIdentity ∧ D.verticalIdentity ∧
  D.interchangeLaw ∧ D.associativityHorizontal ∧
  D.associativityVertical ∧ D.unitLawsHorizontal ∧
  D.unitLawsVertical

theorem double_category_closed_from_evidence (D : DoubleCategoryPackage)
    (E : DoubleCategoryEvidence D) : DoubleCategoryClosed D := by
  exact And.intro E.horizontalCompositionClosed
    (And.intro E.verticalCompositionClosed
      (And.intro E.horizontalIdentityClosed
        (And.intro E.verticalIdentityClosed
          (And.intro E.interchangeLawClosed
            (And.intro E.associativityHorizontalClosed
              (And.intro E.associativityVerticalClosed
                (And.intro E.unitLawsHorizontalClosed
                  E.unitLawsVerticalClosed)))))))

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse