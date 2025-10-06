import Foundation
public final class FxApiClient {
    public struct Configuration { public let apiKey: String; public let baseURL: URL; public init(apiKey: String, baseURL: URL = URL(string: "https://api.fxapi.com")!) { self.apiKey = apiKey; self.baseURL = baseURL } }
    private let cfg: Configuration; private let session: URLSession
    public init(configuration: Configuration, urlSession: URLSession = .shared) { self.cfg = configuration; self.session = urlSession }
    @available(iOS 15.0, macOS 12.0, *)
    public func latest(params: [String: String] = [:]) async throws -> [String: Any] {
        var comps = URLComponents(url: cfg.baseURL.appendingPathComponent("latest"), resolvingAgainstBaseURL: false)!; comps.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        var req = URLRequest(url: comps.url!); req.addValue(cfg.apiKey, forHTTPHeaderField: "apikey")
        let (data, resp) = try await session.data(for: req); try Self.validate(resp); return try Self.json(data)
    }
    private static func validate(_ r: URLResponse) throws { if let h = r as? HTTPURLResponse, !(200..<300).contains(h.statusCode) { throw NSError(domain: "fxapi", code: h.statusCode) } }
    private static func json(_ d: Data) throws -> [String: Any] { guard let o = try JSONSerialization.jsonObject(with: d) as? [String: Any] else { throw NSError(domain: "fxapi", code: -2) }; return o }
}
