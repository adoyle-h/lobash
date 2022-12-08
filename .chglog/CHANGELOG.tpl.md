{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ .Tag.Name }} ({{ datetime "2006-01-02 15:04:05 -07:00" .Tag.Date }})

{{ if .Tag.Previous }}[Full Changes]({{ $.Info.RepositoryURL }}/compare/{{ .Tag.Previous.Name }}...{{ .Tag.Name }}){{ end }}

{{ if .NoteGroups -}}
{{ range .NoteGroups -}}
### {{ .Title }}

{{ range .Notes -}}
{{ .Body }}
{{  end }}
{{  end }}
{{- end -}}

{{ range .CommitGroups -}}
### {{ .Title }}

{{ range .Commits -}}
- {{ if .Scope }}**{{ .Scope }}**: {{ end }}{{ .Subject }} [[{{.Hash.Short}}]({{$.Info.RepositoryURL}}/commit/{{.Hash.Long}})] 
{{- if not (empty .Refs) }} ({{ range .Refs }}#{{ .Ref }} {{ end }}) {{- end }}
{{- if not (empty .Body) }}
  ```
  {{ regexReplaceAll "\n" .Body "\n  " | abbrev 960 }}
  ```
{{ end }}
{{ end }}
{{ end -}}

{{- if .RevertCommits -}}
### Reverts

{{ range .RevertCommits -}}
- {{ .Revert.Header }}
{{ end }}
{{ end -}}

{{- if .MergeCommits -}}
### Pull Requests

{{ range .MergeCommits -}}
- {{ .Header }}
{{ end }}
{{ end -}}
{{ end -}}
