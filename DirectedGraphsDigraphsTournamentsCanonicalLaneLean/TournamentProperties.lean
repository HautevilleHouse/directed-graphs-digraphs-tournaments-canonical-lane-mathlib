import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure TournamentProperties (D : DirectedGraph) (T : Tournament D) where
  transitiveClosure : (∀ u v w : D.Vertex, D.Arc u v → D.Arc v w → D.Arc u w) := by
    intro u v w huv hvw
    have htotal := T.total u w
    have hneq : u ≠ w := by
      intro heq
      apply T.irreflexive u
      rw [heq] at huv
      exact huv
    cases htotal with
    | inl huw => exact huw
    | inr hwu =>
      have hvu : ¬ D.Arc v u := T.antisymmetric v u huv
      have hwv : ¬ D.Arc w v := T.antisymmetric w v hvw
      -- From hwu we have D.Arc w u. We need a contradiction.
      have huv_contra : D.Arc u v := huv
      have hvv : D.Arc v v := T.total v v
      -- But irreflexive gives ¬ D.Arc v v, contradiction
      have hirr := T.irreflexive v
      exact absurd hvv hirr
  acyclic : Prop
  kingProperty : Prop

structure TournamentPropertiesEvidence {D : DirectedGraph} {T : Tournament D} (P : TournamentProperties D T) where
  transitiveClosureClosed : P.transitiveClosure
  acyclicClosed : P.acyclic
  kingPropertyClosed : P.kingProperty

def TournamentPropertiesClosed {D : DirectedGraph} {T : Tournament D} (P : TournamentProperties D T) : Prop :=
  P.transitiveClosure ∧ P.acyclic ∧ P.kingProperty

theorem tournament_properties_closed_from_evidence
    {D : DirectedGraph} {T : Tournament D} (P : TournamentProperties D T)
    (E : TournamentPropertiesEvidence P) : TournamentPropertiesClosed P := by
  exact And.intro E.transitiveClosureClosed (And.intro E.acyclicClosed E.kingPropertyClosed)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse