//
//  spm.swift
//  SmartFrostApp
//
//  Created by Lala on 17.06.2024.
//

import Foundation
import Foundation

class MailService {
    func sendEmail(to recipient: String, subject: String, body: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://api.sendgrid.com/v3/mail/send")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer YOUR_API_KEY", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let emailData = [
            "personalizations": [[
                "to": [["email": recipient]]
            ]],
            "from": ["email": "your-email@example.com"],
            "subject": subject,
            "content": [[
                "type": "text/plain",
                "value": body
            ]]
        ] as [String : Any]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: emailData, options: [])
        } catch {
            print("Error: cannot create JSON from email data")
            completion(false)
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending email: \(error)")
                completion(false)
            } else if let response = response as? HTTPURLResponse, response.statusCode == 202 {
                completion(true)
            } else {
                completion(false)
            }
        }
        task.resume()
    }
}
