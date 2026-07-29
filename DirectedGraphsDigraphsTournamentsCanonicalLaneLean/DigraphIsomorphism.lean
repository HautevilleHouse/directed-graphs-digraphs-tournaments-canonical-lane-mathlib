import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure DigraphIsomorphism where
  source : Type u
  target : Type v
  sourceArcs : source → source → Prop
  targetArcs : target → target → Prop
  bijection : source → target
  preservesArcs : ∀ a b : source, sourceArcs a b ↔ targetArcs (bijection a) (bijection b)
  bijectionInverse : target → source
  leftInverse : ∀ x : source, bijectionInverse (bijection x) = x
  rightInverse : ∀ y : target, bijection (bijectionInverse y) = y

structure IsomorphismPackage (D : DigraphIsomorphism) where
  isomorphismExists : Prop
  invariantPreserved : Prop
  isomorphismExistsClosed : D.isomorphismExists
  invariantPreservedClosed : D.invariantPreserved

def IsomorphismClosed (D : DigraphIsomorphism) : Prop :=
  D.isomorphismExists ∧ D.invariantPreserved

theorem isomorphism_closed_from_evidence (D : DigraphIsomorphism) (E : IsomorphismPackage D) :
    IsomorphismClosed D := by
  exact And.intro E.isomorphismExistsClosed E.invariantPreservedClosed

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse