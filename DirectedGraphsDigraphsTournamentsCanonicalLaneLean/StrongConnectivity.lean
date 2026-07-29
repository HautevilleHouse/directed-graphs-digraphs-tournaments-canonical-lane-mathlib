import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure StrongConnectivity where
  digraph : AdjacencyMatrixObject
  stronglyConnected : ∀ u v, existsDirectedPath u v
  bridgeClosed : bridgeClosed (AdmissibleClass.mk ...)
  gateClosed : gateClosed (AdmissibleClass.mk ...)

def StrongConnectivityClosed (S : StrongConnectivity) : Prop :=
  S.stronglyConnected ∧ S.bridgeClosed ∧ S.gateClosed

end HautevilleHouse
end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
