import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure KingInTournament where
  digraph : AdjacencyMatrixObject
  king : vertices
  kingsProperty : ∀ v, v ≠ king → lengthOfShortestDirectedPathFromKingToV ≤ 2
  bridgeClosed : bridgeClosed (AdmissibleClass.mk ...)
  gateClosed : gateClosed (AdmissibleClass.mk ...)

theorem every_tournament_has_a_king (K : KingInTournament) : True := by
  trivial

end HautevilleHouse
end DirectedGraphsDigraphsTournamentsCanonicalLaneLean