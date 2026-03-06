#!/bin/bash
input=$(cat)
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
model_name=$(echo "$input" | jq -r '.model.display_name // "Claude"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // ""')

status_parts=()
status_parts+=("$model_name")
[ -n "$cwd" ] && status_parts+=("$(basename "$cwd")")

if [ -n "$used_pct" ]; then
  used_int=$(printf "%.0f" "$used_pct")
  bar_width=20
  filled=$(( used_int * bar_width / 100 ))
  empty=$(( bar_width - filled ))
  bar=""
  for ((i=0; i<filled; i++)); do bar+="█"; done
  for ((i=0; i<empty; i++)); do bar+="░"; done
  status_parts+=("[${bar}] ${used_int}%")
fi

printf "%s" "${status_parts[0]}"
for ((i=1; i<${#status_parts[@]}; i++)); do
  printf " | %s" "${status_parts[$i]}"
done
printf "\n"
