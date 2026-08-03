import TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "two-categories-bicategories-double-categories-lemma-canonical-lane",
  theoremName := "TwoCategoriesBicategoriesDoubleCategoriesLemma",
  theoremObject := "Bicategory coherence lemma",
  classicalBoundary := "classical boundary carried by theoremBoundaryOpen",
  constrainedStatement := "constrained 2-categories closure internalized through admissible class",
  certificateLane := "two_categories_constrained",
  carriedRemainder := "unrestricted classical closure remains carried"
}

def ConstrainedTwoCategoriesClosureExternal : Prop :=
  forall A : AdmissibleClass, ConstrainedTwoCategoriesClosure A

theorem constrained_two_categories_closure_external_checked :
    ConstrainedTwoCategoriesClosureExternal := by
  intro A
  exact constrained_two_categories_endgame A

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse