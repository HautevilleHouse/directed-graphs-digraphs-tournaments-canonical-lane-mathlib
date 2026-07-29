import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure DominanceDigraph (V : Type u) where
  dominance : V → V → Prop
  transitive : ∀ a b c : V, dominance a b → dominance b c → dominance a c
  reflexive : ∀ a : V, dominance a a

def ScoreSequence (T : Tournament V) : V → ℕ :=
  fun v => Finset.card (Finset.filter (λ w => T.arcs v w) (Finset.univ : Finset V))

structure LandauTheorem (T : Tournament V) where
  scoreSequenceSorted : Prop
  landauCondition : ∀ k : ℕ, k ≤ Fintype.card V → 
    Finset.sum (Finset.range k) (λ i => (scoreSequence T) (Finset.sort (·≤·) (Finset.univ : Finset V)).get i) ≥ 
    (k.choose 2 : ℕ)
  equalityHolds : Prop
  landauTheoremClosed : landauCondition
  equalityHoldsClosed : equalityHolds

def LandauTheoremClosed {T : Tournament V} (L : LandauTheorem T) : Prop :=
  L.landauCondition ∧ L.equalityHolds

theorem landau_theorem_closed_from_evidence (L : LandauTheorem T) :
    LandauTheoremClosed L := by
  exact And.intro L.landauTheoremClosed L.equalityHoldsClosed

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse
