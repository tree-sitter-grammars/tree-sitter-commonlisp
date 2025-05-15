package tree_sitter_commonlisp_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_commonlisp "github.com/tree-sitter-grammars/tree-sitter-commonlisp/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_commonlisp.Language())
	if language == nil {
		t.Errorf("Error loading Common Lisp grammar")
	}
}
