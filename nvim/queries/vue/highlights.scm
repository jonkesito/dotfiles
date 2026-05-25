;; extends

;; Captura componentes en PascalCase (ej: <UserCard />)
((tag_name) @tag.component
 (#match? @tag.component "^[A-Z]"))

;; Captura componentes con guiones de Nuxt/Vue (ej: <nuxt-img />)
((tag_name) @tag.component
 (#match? @tag.component "-"))

;; Captura exacta de la etiqueta estructural <template>
((tag_name) @tag.template
 (#eq? @tag.template "template"))
