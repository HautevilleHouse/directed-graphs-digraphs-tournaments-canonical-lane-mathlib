import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure AdjacencyMatrixObject where
  vertices : Type u
  adjacency : vertices → vertices → Prop
  irreflexive : ∀ v, ¬ adjacency v v
  asymmetric : ∀ u v, adjacency u v → ¬ adjacency v u

structure AdjacencyMatrixClass where
  obj : AdjacencyMatrixObject
  bridgeClosed : bridgeClosed (AdmissibleClass.mk (admittedClosure ...))
  gateClosed : gateClosed (AdmissibleClass.mk ...)
  matrixClosed : adjacency_matrix_property obj

end HautevilleHouse
end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
