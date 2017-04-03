# Set correct image tag
if [[ $CI_BRANCH =~ ^[0-9].* ]] ; then
  sed -i s/{TAG}/$CI_BRANCH/g kube/*
elif [[ $CI_BRANCH == "demo" ]] ; then
  sed -i s/{TAG}/demo/g kube/*
else
  sed -i s/{TAG}/$CI_COMMIT_ID/g kube/*
fi

fetch-kubeconfig $ENVIRONMENT_ID
kubectl apply -f kube/
