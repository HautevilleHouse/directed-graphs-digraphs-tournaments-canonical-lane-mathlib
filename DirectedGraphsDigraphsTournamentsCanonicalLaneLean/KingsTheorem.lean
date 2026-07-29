import DirectedGraphsDigraphsTournamentsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure KingsTheoremPackage (D : DigraphSpace) where
  kingExists : Prop
  kingReachability : Prop
  kingWitness : D.carrier → Prop

structure KingsTheoremEvidence (D : DigraphSpace) (K : KingsTheoremPackage D) where
  kingExistsClosed : K.kingExists
  kingReachabilityClosed : K.kingReachability

def KingsTheoremClosed (D : DigraphSpace) (K : KingsTheoremPackage D) : Prop :=
  K.kingExists ∧ K.kingReachability

theorem kings_theorem_closed_from_evidence (D : DigraphSpace) (K : KingsTheoremPackage D) (E : KingsTheoremEvidence D K) : KingsTheoremClosed D K := by
  exact And.intro E.kingExistsClosed E.kingReachabilityClosed

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse