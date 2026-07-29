import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure ScoreSequencePackage (T : Tournament V) where
  scoreSet : Finset ℕ
  majorization : Prop
  scoreSequenceUnique : Prop
  scoreSetClosed : scoreSet = Finset.image (scoreSequence T) (Finset.univ : Finset V)
  majorizationClosed : majorization
  scoreSequenceUniqueClosed : scoreSequenceUnique

def ScoreSequenceClosed {T : Tournament V} (S : ScoreSequencePackage T) : Prop :=
  S.scoreSetClosed ∧ S.majorization ∧ S.scoreSequenceUnique

theorem score_sequence_closed_from_evidence (S : ScoreSequencePackage T) :
    ScoreSequenceClosed S := by
  exact And.intro S.scoreSetClosed (And.intro S.majorizationClosed S.scoreSequenceUniqueClosed)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse
