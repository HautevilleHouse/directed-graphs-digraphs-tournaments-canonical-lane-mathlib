import DirectedGraphsDigraphsTournamentsCanonicalLaneLean.ScoreSequence

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure LandauPackage {T : Tournament} (S : ScoreSequencePackage T) where
  scoreSequence : List ℕ
  sorted : List.Sorted (· ≤ ·) scoreSequence
  landauCondition : ∀ (k : ℕ), k ≤ (Finset.card (Finset.univ : Finset T.Vertex)) →
    (List.take k scoreSequence).sum ≥ k * (k - 1) / 2
  landauEquality : (scoreSequence.sum) = (List.length scoreSequence) * (List.length scoreSequence - 1) / 2

structure LandauEvidence {T : Tournament} {S : ScoreSequencePackage T} (L : LandauPackage S) where
  sortedClosed : L.sorted
  landauConditionClosed : L.landauCondition
  landauEqualityClosed : L.landauEquality

def LandauClosed {T : Tournament} {S : ScoreSequencePackage T} (L : LandauPackage S) : Prop :=
  L.sorted ∧ L.landauCondition ∧ L.landauEquality

theorem landau_closed_from_evidence {T : Tournament} {S : ScoreSequencePackage T} (L : LandauPackage S)
    (E : LandauEvidence L) : LandauClosed L := by
  exact And.intro E.sortedClosed (And.intro E.landauConditionClosed E.landauEqualityClosed)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse