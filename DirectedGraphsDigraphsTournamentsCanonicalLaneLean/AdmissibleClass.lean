import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure AdmissibleClass where
  object : DigraphAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DigraphWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse