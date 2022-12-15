{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ .Tag.Name }} ({{ datetime "2006-01-02 15:04:05 -07:00" .Tag.Date }})

{{ if .Tag.Previous -}}
[Full Changes]({{ $.Info.RepositoryURL }}/compare/{{ .Tag.Previous.Name }}...{{ .Tag.Name }})
{{ end }}

{{- if .NoteGroups }}
### Breaking Changes
{{- $noteIdx := 0 -}}
{{- range .NoteGroups }}{{ range .Notes }}
{{- $noteIdx = add $noteIdx 1 -}}
{{ end }}
{{ end }}
Have {{ $noteIdx }} breaking changes. Check below logs with ⚠️ .
{{ end }}

{{- range .CommitGroups }}
### {{ .Title }}

{{ range .Commits -}}
- {{ if .Notes }}⚠️  {{ end }}{{ if .Scope }}**{{ .Scope }}**: {{ end }}
  {{- regexReplaceAll "([^`]<.*>[^`])" .Subject "`$1`" }} ([{{.Hash.Short}}]({{$.Info.RepositoryURL}}/commit/{{.Hash.Long}})
{{- if .Refs }} {{ range .Refs }}[#{{ .Ref }}]({{$.Info.RepositoryURL}}/issues/{{ .Ref }}) {{- end }}{{- end }})
{{- if not (empty .Body) }}
  > {{ regexReplaceAll "\n" .Body "\n  > " | abbrev 960 }}

{{- end }}
{{ end }}
{{- end -}}

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
