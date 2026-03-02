export function snakeCaseToSentenceCase(str: string): string {
  return str?.trim()?.replace(/_/g, " ");
}

export function sentenceCaseToSnakeCase(str: string): string {
  return str?.trim()?.replace(/ /g, "_");
}

// Confirm these work as expected
export function camelCaseToSentenceCase(str: string): string {
  return str
    ?.trim()
    ?.replace(/([a-z])([A-Z])/g, "$1 $2")
    ?.replace(/^./, (match) => match?.toUpperCase()); // Capitalizes the first character
}

export function sentenceCaseToCamelCase(str: string): string {
  return str
    ?.toLowerCase()
    ?.replace(/(^|\s)(\w)/g, (_, p1, p2) => p2?.toUpperCase()) // Capitalize each word
    ?.replace(/^\w/, (match) => match?.toLowerCase()); // Ensure the first character is lowercase
}
