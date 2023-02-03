export async function loader({ params, request, context }: LoaderArgs) {
  const path = new URL(request.url).pathname;

  const valueResp = await fetch('https://page-data-endpoint');
  const valueJson = await bundlesResp.json();

  if (path === "/") {
    return json(valueJson);
  }

  const flagsResp = await fetch("https://feature-flag-endpoint");
  const flagsJson = await flagsResp.json();
  
  if (flagsJson.disableAlternativeRoute) {
    return redirect("/");
  }

  return json(valueJson);
}