import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure DirectedGraphAdmittedObject where
  vertices : Type u
  arcs : vertices → vertices → Prop
  tournamentCondition : ∀ v w : vertices, v ≠ w → (arcs v w) xor (arcs w v)
  conclusion : tournamentCondition

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse
