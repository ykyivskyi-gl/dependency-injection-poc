import XCTest
@testable import DependencyInjectionPoC

class ContentViewModelTest: XCTestCase {
    private var viewModel: ContentViewModel!
    
    override func setUp() {
        self.viewModel = .init()
    }
    
    override func tearDown() {
        self.viewModel = nil
    }
    
    func testUpdateCurrentDate() {
        withDependencies(
            { container in
                container.dateGenerator = .init(generate: {
                    return Date(timeIntervalSince1970: 1577833200)
                })
            },
            operation: {
                XCTAssertNotEqual(
                    viewModel.currentDate.formatted(),
                    "1/1/2020, 0:00"
                )
                viewModel.updateCurrentDate()
                XCTAssertEqual(
                    viewModel.currentDate.formatted(),
                    "1/1/2020, 0:00"
                )
            }
        )
    }
}
