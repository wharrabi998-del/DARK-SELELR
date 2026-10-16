import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    private let gold = Color(
        red: 0.76,
        green: 0.60,
        blue: 0.32
    )

    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 0.94)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        welcomeCard
                        statistics
                        quickActions
                        recentActivity
                    }
                    .padding(20)
                }

                bottomBar
            }
        }
        .preferredColorScheme(.light)
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("DARK")
                    .font(.system(size: 27, weight: .black))
                    .tracking(3)

                Text("RESELLER MANAGEMENT")
                    .font(.system(size: 9, weight: .medium))
                    .tracking(2)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "person.crop.circle")
                .font(.system(size: 30, weight: .light))
                .foregroundStyle(gold)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 18)
        .background(.white.opacity(0.85))
    }

    private var welcomeCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("YOUR BUSINESS")
                    .font(.system(size: 10, weight: .bold))
                    .tracking(2)
                    .foregroundStyle(.white.opacity(0.75))

                Spacer()

                Image(systemName: "sparkles")
                    .foregroundStyle(.white.opacity(0.8))
            }

            Text("Welcome Back")
                .font(.system(size: 27, weight: .semibold))
                .foregroundStyle(.white)

            Text("Manage your products and resellers in one place.")
                .font(.system(size: 13))
                .foregroundStyle(.white.opacity(0.85))

            HStack {
                Label("Dashboard", systemImage: "square.grid.2x2")
                    .font(.system(size: 12, weight: .semibold))

                Spacer()

                Image(systemName: "arrow.up.right")
            }
            .foregroundStyle(.white)
            .padding(.top, 8)
        }
        .padding(22)
        .background {
            LinearGradient(
                colors: [
                    gold,
                    Color(red: 0.55, green: 0.41, blue: 0.23)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: gold.opacity(0.2), radius: 15, y: 8)
    }

    private var statistics: some View {
        HStack(spacing: 12) {
            statCard(
                title: "BALANCE",
                value: "$0.00",
                icon: "wallet.pass"
            )

            statCard(
                title: "ORDERS",
                value: "0",
                icon: "bag"
            )
        }
    }

    private func statCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(gold)

            Text(title)
                .font(.system(size: 10, weight: .medium))
                .tracking(1)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.system(size: 23, weight: .semibold))
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(.white.opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        }
    }

    private var quickActions: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("QUICK ACCESS")
                .font(.system(size: 11, weight: .bold))
                .tracking(2)
                .foregroundStyle(.secondary)

            actionRow(
                title: "Products",
                subtitle: "Browse available products",
                icon: "square.grid.2x2"
            )

            actionRow(
                title: "My Orders",
                subtitle: "View your purchase history",
                icon: "receipt"
            )

            actionRow(
                title: "My Account",
                subtitle: "Manage your account",
                icon: "person.crop.circle"
            )
        }
    }

    private func actionRow(
        title: String,
        subtitle: String,
        icon: String
    ) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 19))
                .foregroundStyle(gold)
                .frame(width: 48, height: 48)
                .background(gold.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 15))

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))

                Text(subtitle)
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.tertiary)
        }
        .padding(14)
        .background(.white.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 19))
    }

    private var recentActivity: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("RECENT ACTIVITY")
                .font(.system(size: 11, weight: .bold))
                .tracking(2)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                Image(systemName: "clock")
                    .foregroundStyle(gold)

                Text("Your recent activity will appear here.")
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(18)
            .background(.white.opacity(0.85))
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }

    private var bottomBar: some View {
        HStack {
            tabButton("Home", icon: "house.fill", index: 0)
            Spacer()
            tabButton("Products", icon: "square.grid.2x2", index: 1)
            Spacer()
            tabButton("Orders", icon: "bag", index: 2)
            Spacer()
            tabButton("Profile", icon: "person", index: 3)
        }
        .padding(.horizontal, 28)
        .padding(.top, 13)
        .padding(.bottom, 10)
        .background(.white)
    }

    private func tabButton(
        _ title: String,
        icon: String,
        index: Int
    ) -> some View {
        Button {
            withAnimation(.smooth(duration: 0.25)) {
                selectedTab = index
            }
        } label: {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 18))

                Text(title)
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundStyle(selectedTab == index ? gold : .gray)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ContentView()
}
