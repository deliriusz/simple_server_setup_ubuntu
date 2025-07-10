#!/usr/bin/env bash

USER_SESSION_PARAM="$1"

# $1 - session name
audit_template () {
   session="$1"
   tmux new-session -d -s $session

   # I have window 0 called zsh, hence I don't pass 0 as 1st window
   tmux rename-window -t $session:zsh 'run'
   tmux split-window -t $session -h
   # tmux send-keys -t $session:$window 'git fetch --prune --all' C-m

   window='vim'
   tmux new-window -t $session -n $window
   tmux send-keys -t $session:$window 'nvim'

   window='test'
   tmux new-window -t $session -n $window

   window='misc'
   tmux new-window -t $session -n $window
   # tmux send-keys -t $session:$window 'npm run serve'

   window='misc2'
   tmux new-window -t $session -n $window

   # move to 2nd window
   tmux select-window -t $session:2

   tmux attach-session -t $session
}

SESSION_TEMPLATE_NAMES=("audit_template")

# $1 - name
newFromTemplate () {
   declare -A SESSION_TEMPLATES
   COUNTER=1
   echo "New session requested. Choose template: "
   for TEMPLATE in "${SESSION_TEMPLATE_NAMES[@]}"; do
      echo "$COUNTER: $TEMPLATE"
      SESSION_TEMPLATES[$COUNTER]=$TEMPLATE
      ((COUNTER+=1))
   done

   read TEMPLATE_OPTION

   # TEMPLATE="${SESSION_TEMPLATES[$TEMPLATE_OPTION]}"

   # ${TEMPLATE $1}

   ${SESSION_TEMPLATES[$TEMPLATE_OPTION]} $1
   # "${SESSION_TEMPLATES[$TEMPLATE_OPTION]}"
}


pick_session () {
   declare -A OPTIONS

   COUNTER=1
   for SESSION in $(tmux ls | cut -d: -f1); do
      echo "$COUNTER: $SESSION"
      OPTIONS[$COUNTER]="$SESSION"
      ((COUNTER+=1))
   done

   echo "Choose id of existing sessions to attach to or a name of your new session:"
   read USER_OPTION

   # echo "$USER_OPTION"
   # echo "${OPTIONS[$USER_OPTION]}"

   POSSIBLE_SESSION="${OPTIONS[$USER_OPTION]}"
}

if [ -z $USER_SESSION_PARAM ]; then
   pick_session
else
   if tmux has-session -t $USER_SESSION_PARAM 2>/dev/null; then
      POSSIBLE_SESSION=$USER_SESSION_PARAM
      USER_OPTION=$USER_SESSION_PARAM
   else
      # pick_session
      USER_OPTION=$USER_SESSION_PARAM
   fi
fi

if [ -z "$POSSIBLE_SESSION" ]; then
   # tmux new -d -s "$USER_OPTION"
   newFromTemplate "$USER_OPTION"
   # tmux new -s "$USER_OPTION"
   # tmux attach-session -t "$USER_OPTION"
else
   tmux attach -t "$POSSIBLE_SESSION"
fi
