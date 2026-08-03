import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean.DoubleCategory

namespace HautevilleHouse
namespace TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean

structure InterchangeLawEvidence (D : DoubleCategory) where
  interchangeLawClosed : D.interchangeLaw

theorem interchange_law_holds (D : DoubleCategory) (E : InterchangeLawEvidence D) : DoubleCategoryClosed D :=
  E.interchangeLawClosed

end TwoCategoriesBicategoriesDoubleCategoriesLemmaCanonicalLaneLean
end HautevilleHouse
