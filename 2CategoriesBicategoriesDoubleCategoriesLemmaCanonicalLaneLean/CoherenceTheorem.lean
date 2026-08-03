import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure CoherenceTheoremPackage where
  strictTwoCategoryExists : Prop
  biCategoryStrictification : Prop
  doubleCategoryGrayProduct : Prop
  coherenceProof : Prop

structure CoherenceTheoremEvidence (C : CoherenceTheoremPackage) where
  strictTwoCategoryExistsClosed : C.strictTwoCategoryExists
  biCategoryStrictificationClosed : C.biCategoryStrictification
  doubleCategoryGrayProductClosed : C.doubleCategoryGrayProduct
  coherenceProofClosed : C.coherenceProof

def CoherenceTheoremClosed (C : CoherenceTheoremPackage) : Prop :=
  C.strictTwoCategoryExists ∧ C.biCategoryStrictification ∧
  C.doubleCategoryGrayProduct ∧ C.coherenceProof

theorem coherence_theorem_closed_from_evidence (C : CoherenceTheoremPackage)
    (E : CoherenceTheoremEvidence C) : CoherenceTheoremClosed C := by
  exact And.intro E.strictTwoCategoryExistsClosed
    (And.intro E.biCategoryStrictificationClosed
      (And.intro E.doubleCategoryGrayProductClosed
        E.coherenceProofClosed))

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse