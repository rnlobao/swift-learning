
var email = "robson@gmail.com"
var count = 0
var whereisarroba = 0
for n in email {
    if n == "@" {
        whereisarroba = count
    }
    count += 1
}
print(whereisarroba)
var letra = email[email.index(email.startIndex, offsetBy: whereisarroba)]



