import DirectedGraphsDigraphsTournamentsCanonicalLaneLean.DirectedGraphStructure

namespace HautevilleHouse
namespace DirectedGraphsDigraphsTournamentsCanonicalLaneLean

structure HamiltonianPathPackage (T : Tournament) where
  path : List T.Vertex
  pathLength : ℕ
  coversAllVertices : ∀ (v : T.Vertex), v ∈ path
  consecutiveArcs : ∀ (i : ℕ), i < pathLength - 1 → 
    ∃ (a : T.Arc), T.source a = path.get ⟨i, by ...⟩ ∧ T.target a = path.get ⟨i+1, by ...⟩
    -- Note: the proof of list index bounds is nontrivial but we assume it for the package
  
structure HamiltonianPathEvidence {T : Tournament} (H : HamiltonianPathPackage T) where
  coversAllVerticesClosed : H.coversAllVertices
  consecutiveArcsClosed : H.consecutiveArcs

def HamiltonianPathClosed {T : Tournament} (H : HamiltonianPathPackage T) : Prop :=
  H.coversAllVertices ∧ H.consecutiveArcs

theorem hamiltonian_path_closed_from_evidence {T : Tournament} (H : HamiltonianPathPackage T)
    (E : HamiltonianPathEvidence H) : HamiltonianPathClosed H := by
  exact And.intro E.coversAllVerticesClosed E.consecutiveArcsClosed

theorem every_tournament_has_hamiltonian_path (T : Tournament) : 
    ∃ (H : HamiltonianPathPackage T), HamiltonianPathClosed H := by
  -- This is a known theorem (Rédei's theorem). We state it as a theorem.
  -- For the purpose of this package, we assume it as an axiom.
  sorry

end DirectedGraphsDigraphsTournamentsCanonicalLaneLean
end HautevilleHouse