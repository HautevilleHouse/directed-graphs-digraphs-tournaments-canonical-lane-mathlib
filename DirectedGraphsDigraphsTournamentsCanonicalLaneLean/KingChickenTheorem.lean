import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure KingChickenPackage (T : Tournament V) where
  kingExists : Prop
  distanceTwo : ∀ v : V, ∃ w : V, w ≠ v ∧ T.arcs v w
  kingExistsClosed : kingExists
  distanceTwoClosed : distanceTwo

def KingChickenClosed {T : Tournament V} (K : KingChickenPackage T) : Prop :=
  K.kingExists ∧ K.distanceTwo

theorem king_chicken_closed_from_evidence (K : KingChickenPackage T) :
    KingChickenClosed K := by
  exact And.intro K.kingExistsClosed K.distanceTwoClosed

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse
