import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure TwoCategoryAdmittedObject where
  carrier : Type u
  oneMorphisms : carrier → carrier → Type v
  twoMorphisms : ∀ {a b : carrier}, oneMorphisms a b → oneMorphisms a b → Type w
  twoCategoryAxioms : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : TwoCategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse