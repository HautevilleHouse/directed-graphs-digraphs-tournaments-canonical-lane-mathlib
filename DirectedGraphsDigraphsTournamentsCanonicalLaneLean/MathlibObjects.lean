import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure DigraphSpace where
  carrier : Type
  adjacency : carrier → carrier → Prop

definition Tournament (D : DigraphSpace) : Prop :=
  ∀ a b : D.carrier, a ≠ b → (D.adjacency a b) ⊕ (D.adjacency b a)

structure DigraphAdmittedObject where
  space : DigraphSpace
  isFinite : Prop
  isTournament : Prop
  conclusion : DigraphWitnessClosed this

def DigraphWitnessClosed (O : DigraphAdmittedObject) : Prop :=
  O.isTournament → (∃ (h : HamiltonianPath O.space), True)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse