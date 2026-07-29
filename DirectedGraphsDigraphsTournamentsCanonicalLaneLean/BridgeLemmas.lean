import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DigraphWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse