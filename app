<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Advanced Investment Growth Simulator</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
      }
      /* Main title styling */
      #mainTitle {
        text-align: center;
        font-size: 32px;
        margin-bottom: 10px;
      }
      /* Scenario selection container (below main title) */
      #scenarioSelection {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 20px;
        background: #f9f9f9;
      }
      #scenarioSelection h2 {
        font-size: 20px;
        margin-top: 0;
      }
      #scenarioSelection label {
        display: block;
        margin: 5px 0;
        font-size: 14px;
        cursor: pointer;
      }
      /* Grid container for the overall app: 2 rows and 2 columns */
      #gridContainer {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 20px;
      }
      /* Each section style with pastel backgrounds */
      .section {
        border: 1px solid #ccc;
        padding: 15px;
        box-sizing: border-box;
      }
      #inputSection {
        min-height: 300px;
        background: #e3f2fd; /* Light blue */
      }
      #summarySection {
        background: #e8f5e9; /* Light green */
      }
      #tableSection {
        background: #fffde7; /* Soft yellow */
      }
      #graphSection {
        background: #fce4ec; /* Light pink */
      }
      /* Input fields and labels */
      input,
      select {
        margin: 5px 0;
        padding: 5px;
        font-size: 14px;
        width: 200px;
      }
      label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
      }
      button {
        margin-top: 15px;
        padding: 10px 20px;
        font-size: 16px;
      }
      /* Withdrawals & Deposits Section (collapsible) */
      #wdSection {
        margin-top: 15px;
        padding: 10px;
        border: 1px solid #ccc;
        background: #eee;
        display: none;
      }
      #wdSection h3 {
        margin-top: 0;
      }
      #resetWD {
        margin-top: 10px;
        padding: 5px 10px;
        font-size: 14px;
      }
      /* Summary Section layout: Use nested grid (2 rows) */
      #summaryContainer {
        display: grid;
        grid-template-rows: auto 1fr;
        gap: 20px;
        max-width: 800px;
        margin: 0 auto;
        min-height: 345px;
      }
      /* Summary table in top row */
      #summaryTableWrapper {
        /* Let the table take only the needed height */
      }
      /* Graphs container in bottom row: arrange canvases side by side */
      #graphsContainer {
        display: flex;
        flex-direction: row;
        gap: 20px;
      }
      /* Specific size for the bar graph canvas */
      #barGraph {
        max-width: 600px;
        height: 450px;
      }
      #graphsContainer canvas {
        width: 100%;
        max-width: 380px;
        height: 350px;
        flex: 1;
      }
      /* Table styling */
      #tableContainer table {
        width: 100%;
        border-collapse: collapse;
      }
      #tableContainer th,
      #tableContainer td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: right;
      }
      #tableContainer th {
        background: #f4f4f4;
      }
      /* Graph Section styling */
      #graphSection canvas {
        border: 1px solid #ccc;
        background: #fff;
      }
    </style>
  </head>
  <body>
    <!-- Main title for the whole app -->
    <h1 id="mainTitle">Advanced Investment Growth Simulator</h1>

    <!-- Scenario Selection Section -->
    <div id="scenarioSelection">
      <h2>Choose a Scenario:</h2>
      <!-- New scenario "Recommended Mix" is now selected by default -->
      <label>
        <input type="radio" name="scenario" value="recommended" checked />
        Recommended Mix of 25% Bitcoin + 5% Crypto + 40% Real Estate + 20% Tech
        Stocks + 10% Cash
      </label>
      <label>
        <input type="radio" name="scenario" value="balanced" />
        Balanced Traditional Portfolio (Expected CAGR: 12%, Yearly Change in
        CAGR: 0%, Volatility: 20%, Yearly Change in Volatility: 0%)
      </label>
      <label>
        <input type="radio" name="scenario" value="bitcoin" />
        Bitcoin Only (Expected CAGR: 45%, Yearly Change in CAGR: –10%,
        Volatility: 70%, Yearly Change in Volatility: –10%)
      </label>
      <label>
        <input type="radio" name="scenario" value="crypto" />
        Crypto Only (Expected CAGR: 65%, Yearly Change in CAGR: –15%,
        Volatility: 100%, Yearly Change in Volatility: –15%)
      </label>
      <label>
        <input type="radio" name="scenario" value="retirement" />
        Retirement ETFs and REITs (Expected CAGR: 10%, Yearly Change in CAGR:
        0%, Volatility: 10%, Yearly Change in Volatility: 0%)
      </label>
    </div>

    <div id="gridContainer">
      <!-- User Input Section -->
      <div id="inputSection" class="section">
        <p>
          Enter your basic parameters below and click "Simulate" to see growth
          scenarios.
        </p>

        <label for="initialBalance">Initial Balance ($):</label>
        <input
          type="number"
          id="initialBalance"
          value="250000"
          step="any"
          title="This is your starting investment amount and forms the foundation of your portfolio. A higher initial balance provides a greater base for compound growth and can significantly affect your overall returns. It is essential to consider how much capital you are comfortable investing for the long term. The value you choose will directly influence the scale of your future portfolio."
        />

        <label for="expectedCAGR">Expected CAGR (% per year):</label>
        <input
          type="number"
          id="expectedCAGR"
          value="25"
          step="any"
          title="This parameter indicates your expected Compound Annual Growth Rate (CAGR) before adjustments for volatility. In the Recommended Mix scenario, it is preset to 25%, reflecting an aggressive growth expectation. A higher CAGR implies a more aggressive strategy, which can result in higher returns but also carries more risk. Consider how this rate aligns with your financial goals and risk tolerance over time."
        />

        <label for="yearlyCAGRChange"
          >Yearly Change in CAGR (% per year):</label
        >
        <input
          type="number"
          id="yearlyCAGRChange"
          value="-5"
          step="any"
          title="This value represents the expected annual change in your CAGR. A negative change of –5% indicates that you expect your growth rate to gradually decline over time, possibly due to market saturation or increased competition. This parameter helps model the long-term evolution of your portfolio's growth. It is important to consider historical trends and future uncertainties when setting this value."
        />

        <label for="years">Number of Years:</label>
        <input
          type="number"
          id="years"
          value="10"
          title="This is the time horizon over which your investment will be simulated. A longer period allows for greater compound growth, though it also introduces more uncertainty. Your chosen duration should match your long-term financial goals, such as retirement planning. It is a crucial factor in determining the overall performance of your portfolio."
        />

        <label for="volatility">Volatility (% adjustment on CAGR):</label>
        <input
          type="number"
          id="volatility"
          value="35"
          step="any"
          title="Volatility measures the degree of fluctuation in your investment returns due to market uncertainty. A volatility of 35% in the Recommended Mix scenario reflects a moderately high level of risk. Higher volatility means your returns can vary widely from year to year, affecting the predictability of your portfolio’s growth. It is an important measure of risk that should be balanced with your growth expectations."
        />

        <label for="yearlyVolatilityChange"
          >Yearly Change in Volatility (% per year):</label
        >
        <input
          type="number"
          id="yearlyVolatilityChange"
          value="-5"
          step="any"
          title="This parameter indicates how you expect the market volatility to change annually. A negative value of –5% suggests that you expect the volatility to gradually decrease over time, potentially reflecting improved market stability. This can influence the overall risk of your portfolio. Adjust this parameter based on your outlook for market conditions in the future."
        />

        <button id="toggleWD">Show Withdrawals and Deposits</button>
        <div id="wdSection">
          <h3>Withdrawals and Deposits</h3>
          <label for="monthlyWithdrawal">Monthly Withdrawal ($):</label>
          <input
            type="number"
            id="monthlyWithdrawal"
            value="0"
            step="any"
            title="This value sets the fixed monthly withdrawal from your portfolio. Regular withdrawals reduce the capital available for compounding, which may lower your final portfolio value. It is important if you require a steady cash flow from your investments. Consider your income needs versus your long-term growth objectives."
          />

          <label for="yearlyWithdrawalChange"
            >Yearly Change in Withdrawal (% per year):</label
          >
          <input
            type="number"
            id="yearlyWithdrawalChange"
            value="0"
            step="any"
            title="This parameter adjusts your monthly withdrawal amount each year. A positive percentage means withdrawals will increase over time, reducing the funds available for growth. A negative percentage implies a decrease over time. Use this value to model changes in your cash flow requirements."
          />

          <label for="withdrawalStartDelay"
            >Withdrawal Start Delay (years):</label
          >
          <input
            type="number"
            id="withdrawalStartDelay"
            value="0"
            min="0"
            title="This specifies how many years you will wait before starting withdrawals. Delaying withdrawals allows your investment to compound longer, potentially leading to a higher portfolio value. Consider your short-term liquidity needs versus long-term growth. This decision can have a significant impact on the final outcomes."
          />

          <label for="monthlyDeposit">Monthly Deposit ($):</label>
          <input
            type="number"
            id="monthlyDeposit"
            value="0"
            step="any"
            title="This field sets the amount you plan to contribute to your portfolio every month. Regular deposits increase your principal, enhancing the power of compounding returns. They are crucial if you intend to grow your investments continuously over time. Adjust this value based on your savings capacity and investment goals."
          />

          <label for="yearlyDepositChange"
            >Yearly Change in Deposit (% per year):</label
          >
          <input
            type="number"
            id="yearlyDepositChange"
            value="0"
            step="any"
            title="This parameter modifies your monthly deposit amount annually. A positive change indicates increasing contributions over time, which can accelerate growth. A negative change implies that your contributions will decrease over time. Use this setting to reflect anticipated changes in your income or saving strategy."
          />

          <label for="depositEndDelay">Deposit End Delay (years):</label>
          <input
            type="number"
            id="depositEndDelay"
            value="0"
            min="0"
            title="This value defines the number of years during which you will make monthly deposits. After this period, no additional contributions will be made, and your portfolio growth will depend solely on returns. This setting helps simulate life events such as retirement. Choose a duration that aligns with your personal financial plans."
          />

          <label
            title="If checked, withdrawals will be skipped when the effective CAGR is negative."
          >
            <input type="checkbox" id="noWithdrawalOnNegative" checked />
            No Withdrawal when Effective CAGR is Negative
          </label>

          <button id="resetWD">Reset Withdrawals & Deposits to 0</button>
        </div>

        <!-- New Rainy Day Fund inputs -->
        <label
          title="Enabling this option allocates a portion of your portfolio to a safer, lower-risk account to protect against market downturns."
        >
          <input type="checkbox" id="enableRainyDayFund" />
          Enable Rainy Day Fund
        </label>
        <label for="rainyDayFundPercentage"
          >Rainy Day Fund Allocation (% of total):</label
        >
        <input
          type="number"
          id="rainyDayFundPercentage"
          value="2"
          step="any"
          title="This value determines the percentage of your total portfolio that will be reserved as a safety net. A higher allocation increases financial security but may reduce overall growth potential. It is important to balance risk and liquidity needs. Adjust this value based on your personal risk tolerance and financial goals."
        />
        <label for="yearlyRainyDayFundChange">
          Yearly Change in Rainy Day Fund Allocation (% per year):
        </label>
        <input
          type="number"
          id="yearlyRainyDayFundChange"
          value="5"
          step="any"
          title="This parameter adjusts the percentage of your portfolio allocated to the Rainy Day Fund on an annual basis. A positive value increases the allocation over time, offering more security but potentially limiting growth. A negative value decreases the allocation. Use this to simulate a shifting risk profile in your portfolio."
        />

        <label for="numSimulations">Number of Simulations:</label>
        <input
          type="number"
          id="numSimulations"
          value="10000"
          title="This sets the number of simulation runs. More simulations provide a more statistically reliable picture of potential outcomes, capturing a wide range of scenarios. However, a higher number may take longer to process. Choose a value that balances accuracy with performance."
        />

        <br />
        <button id="simulateButton">Simulate</button>
      </div>

      <!-- Summary Section -->
      <div id="summarySection" class="section">
        <div id="summaryContainer">
          <div id="summaryTableWrapper">
            <h3>Simulation Summary</h3>
            <table>
              <!-- Summary table content inserted dynamically -->
            </table>
          </div>
          <div id="graphsContainer">
            <canvas id="barGraph"></canvas>
            <canvas id="sortedGraph"></canvas>
          </div>
        </div>
      </div>

      <!-- Table Section -->
      <div id="tableSection" class="section">
        <div id="tableContainer"></div>
      </div>

      <!-- Graph Section -->
      <div id="graphSection" class="section">
        <h2>Investment Growth Graph</h2>
        <p>(Simulations with Min, Max, Avg, and Median Values)</p>
        <canvas id="graph" width="700" height="400"></canvas>
      </div>
    </div>

    <script>
      // Helper function to calculate median of an array.
      function median(arr) {
        var sorted = arr.slice().sort((a, b) => a - b);
        var len = sorted.length;
        if (len % 2 === 1) {
          return sorted[Math.floor(len / 2)];
        } else {
          return (sorted[len / 2 - 1] + sorted[len / 2]) / 2;
        }
      }

      // Helper function to abbreviate numbers (e.g., 1000000 → "1.0 M", 150000 → "150k").
      function abbreviateNumber(num) {
        var absNum = Math.abs(num);
        if (absNum >= 1e6) {
          return (num / 1e6).toFixed(1) + " M";
        } else if (absNum >= 1e3) {
          return (num / 1e3).toFixed(0) + "k";
        } else {
          return num.toString();
        }
      }

      // Scenario selection event listener.
      var radios = document.getElementsByName("scenario");
      for (var i = 0; i < radios.length; i++) {
        radios[i].addEventListener("change", function () {
          if (this.checked) {
            if (this.value === "recommended") {
              document.getElementById("expectedCAGR").value = 25;
              document.getElementById("yearlyCAGRChange").value = -5;
              document.getElementById("volatility").value = 35;
              document.getElementById("yearlyVolatilityChange").value = -5;
            } else if (this.value === "balanced") {
              document.getElementById("expectedCAGR").value = 12;
              document.getElementById("yearlyCAGRChange").value = 0;
              document.getElementById("volatility").value = 20;
              document.getElementById("yearlyVolatilityChange").value = 0;
            } else if (this.value === "bitcoin") {
              document.getElementById("expectedCAGR").value = 45;
              document.getElementById("yearlyCAGRChange").value = -10;
              document.getElementById("volatility").value = 70;
              document.getElementById("yearlyVolatilityChange").value = -10;
            } else if (this.value === "crypto") {
              document.getElementById("expectedCAGR").value = 65;
              document.getElementById("yearlyCAGRChange").value = -15;
              document.getElementById("volatility").value = 100;
              document.getElementById("yearlyVolatilityChange").value = -15;
            } else if (this.value === "retirement") {
              document.getElementById("expectedCAGR").value = 10;
              document.getElementById("yearlyCAGRChange").value = 0;
              document.getElementById("volatility").value = 10;
              document.getElementById("yearlyVolatilityChange").value = 0;
            }
          }
        });
      }

      // Toggle function for Withdrawals and Deposits section.
      document
        .getElementById("toggleWD")
        .addEventListener("click", function () {
          var wdSection = document.getElementById("wdSection");
          if (
            wdSection.style.display === "none" ||
            wdSection.style.display === ""
          ) {
            wdSection.style.display = "block";
            this.textContent = "Hide Withdrawals and Deposits";
          } else {
            wdSection.style.display = "none";
            this.textContent = "Show Withdrawals and Deposits";
          }
        });

      // Reset function for WD section.
      document.getElementById("resetWD").addEventListener("click", function () {
        document.getElementById("monthlyWithdrawal").value = 0;
        document.getElementById("yearlyWithdrawalChange").value = 0;
        document.getElementById("withdrawalStartDelay").value = 0;
        document.getElementById("monthlyDeposit").value = 0;
        document.getElementById("yearlyDepositChange").value = 0;
        document.getElementById("depositEndDelay").value = 0;
      });

      // Helper: format currency (for simulation summary and tables).
      function formatCurrency(value, decimals) {
        return value.toLocaleString("en-US", {
          minimumFractionDigits: decimals,
          maximumFractionDigits: decimals,
        });
      }

      // Utility: random number.
      function randomBetween(min, max) {
        return Math.random() * (max - min) + min;
      }

      function simulateInvestment() {
        var initialBalance = parseFloat(
          document.getElementById("initialBalance").value
        );
        var expectedCAGR =
          parseFloat(document.getElementById("expectedCAGR").value) / 100;
        var yearlyCAGRChange =
          parseFloat(document.getElementById("yearlyCAGRChange").value) / 100;
        var years = parseInt(document.getElementById("years").value, 10);
        var volatility =
          parseFloat(document.getElementById("volatility").value) / 100;
        var yearlyVolatilityChange =
          parseFloat(document.getElementById("yearlyVolatilityChange").value) /
          100;

        // Withdrawal parameters.
        var monthlyWithdrawal = parseFloat(
          document.getElementById("monthlyWithdrawal").value
        );
        var yearlyWithdrawalChange =
          parseFloat(document.getElementById("yearlyWithdrawalChange").value) /
          100;
        var withdrawalStartDelay = parseInt(
          document.getElementById("withdrawalStartDelay").value,
          10
        );
        if (withdrawalStartDelay > years) {
          withdrawalStartDelay = years;
        }

        // Deposit parameters.
        var monthlyDeposit = parseFloat(
          document.getElementById("monthlyDeposit").value
        );
        var yearlyDepositChange =
          parseFloat(document.getElementById("yearlyDepositChange").value) /
          100;
        var depositEndDelay = parseInt(
          document.getElementById("depositEndDelay").value,
          10
        );
        if (depositEndDelay > years) {
          depositEndDelay = years;
        }

        // Rainy Day Fund parameters.
        var enableRainyDayFund =
          document.getElementById("enableRainyDayFund").checked;
        var rainyDayFundPercentage =
          parseFloat(document.getElementById("rainyDayFundPercentage").value) /
          100;
        var yearlyRainyDayFundChange =
          parseFloat(
            document.getElementById("yearlyRainyDayFundChange").value
          ) / 100;

        var numSimulations = parseInt(
          document.getElementById("numSimulations").value,
          10
        );
        var noWithdrawalOnNegative = document.getElementById(
          "noWithdrawalOnNegative"
        ).checked;

        var finalBalances = [];
        var simulationCAGRs = [];
        var simulationResults = [];
        var negativeYearsArray = []; // Track negative effective CAGR years per simulation.
        var rainyDayFinals = []; // Track final Rainy Day Fund balance.

        for (var sim = 0; sim < numSimulations; sim++) {
          var data = [];

          if (enableRainyDayFund) {
            var mainBalance = initialBalance;
            var rainyDayBalance = 0;
            var currentRainyFundAllocation = rainyDayFundPercentage;

            data.push({
              year: 0,
              balance: mainBalance + rainyDayBalance,
              effectiveCAGR: 0,
              cagrUsed: expectedCAGR,
              volatility: volatility,
              randomAdjustment: 0,
              withdrawalApplied:
                withdrawalStartDelay === 0 ? monthlyWithdrawal : 0,
              depositApplied: depositEndDelay === 0 ? monthlyDeposit : 0,
              rainyDayFund: rainyDayBalance,
            });

            var currentCAGR = expectedCAGR;
            var currentVolatility = volatility;
            var currentWithdrawal = monthlyWithdrawal;
            var currentDeposit = monthlyDeposit;

            for (var i = 1; i <= years; i++) {
              var depositApplied = 0;
              if (i <= depositEndDelay) {
                mainBalance += currentDeposit * 12;
                depositApplied = currentDeposit;
              }

              var baseCAGRUsed = currentCAGR;
              var randomAdjustment = randomBetween(
                -currentVolatility,
                currentVolatility
              );
              var effectiveCAGR = baseCAGRUsed + randomAdjustment;

              mainBalance = mainBalance * (1 + effectiveCAGR);

              var withdrawalApplied = 0;
              if (i >= withdrawalStartDelay) {
                withdrawalApplied = currentWithdrawal;
                if (noWithdrawalOnNegative && effectiveCAGR < 0) {
                  withdrawalApplied = 0;
                } else {
                  mainBalance -= currentWithdrawal * 12;
                }
              }

              var totalPortfolio = mainBalance + rainyDayBalance;
              var desiredRainy = totalPortfolio * currentRainyFundAllocation;
              var transfer = desiredRainy - rainyDayBalance;
              if (transfer > 0) {
                if (mainBalance >= transfer) {
                  mainBalance -= transfer;
                  rainyDayBalance += transfer;
                } else {
                  rainyDayBalance += mainBalance;
                  mainBalance = 0;
                }
              } else if (transfer < 0) {
                var transferBack = -transfer;
                if (rainyDayBalance >= transferBack) {
                  rainyDayBalance -= transferBack;
                  mainBalance += transferBack;
                } else {
                  mainBalance += rainyDayBalance;
                  rainyDayBalance = 0;
                }
              }

              data.push({
                year: i,
                balance: mainBalance + rainyDayBalance,
                effectiveCAGR: effectiveCAGR,
                cagrUsed: baseCAGRUsed,
                volatility: currentVolatility,
                randomAdjustment: randomAdjustment,
                withdrawalApplied: withdrawalApplied,
                depositApplied: depositApplied,
                rainyDayFund: rainyDayBalance,
              });

              currentCAGR = currentCAGR * (1 + yearlyCAGRChange);
              currentVolatility =
                currentVolatility * (1 + yearlyVolatilityChange);
              currentWithdrawal =
                currentWithdrawal * (1 + yearlyWithdrawalChange);
              currentDeposit = currentDeposit * (1 + yearlyDepositChange);
              currentRainyFundAllocation =
                currentRainyFundAllocation * (1 + yearlyRainyDayFundChange);
            }
            simulationResults.push(data);
            finalBalances.push(mainBalance + rainyDayBalance);
            simulationCAGRs.push(
              Math.pow(
                (mainBalance + rainyDayBalance) / initialBalance,
                1 / years
              ) - 1
            );
            rainyDayFinals.push(rainyDayBalance);
          } else {
            var currentBalance = initialBalance;
            data.push({
              year: 0,
              balance: currentBalance,
              effectiveCAGR: 0,
              cagrUsed: expectedCAGR,
              volatility: volatility,
              randomAdjustment: 0,
              withdrawalApplied:
                withdrawalStartDelay === 0 ? monthlyWithdrawal : 0,
              depositApplied: depositEndDelay === 0 ? monthlyDeposit : 0,
            });

            var currentCAGR = expectedCAGR;
            var currentVolatility = volatility;
            var currentWithdrawal = monthlyWithdrawal;
            var currentDeposit = monthlyDeposit;

            for (var i = 1; i <= years; i++) {
              var depositApplied = 0;
              if (i <= depositEndDelay) {
                currentBalance += currentDeposit * 12;
                depositApplied = currentDeposit;
              }
              var baseCAGRUsed = currentCAGR;
              var randomAdjustment = randomBetween(
                -currentVolatility,
                currentVolatility
              );
              var effectiveCAGR = baseCAGRUsed + randomAdjustment;
              currentBalance = currentBalance * (1 + effectiveCAGR);
              var withdrawalApplied = 0;
              if (i >= withdrawalStartDelay) {
                withdrawalApplied = currentWithdrawal;
                if (noWithdrawalOnNegative && effectiveCAGR < 0) {
                  withdrawalApplied = 0;
                } else {
                  currentBalance -= currentWithdrawal * 12;
                }
              }
              data.push({
                year: i,
                balance: currentBalance,
                effectiveCAGR: effectiveCAGR,
                cagrUsed: baseCAGRUsed,
                volatility: currentVolatility,
                randomAdjustment: randomAdjustment,
                withdrawalApplied: withdrawalApplied,
                depositApplied: depositApplied,
              });
              currentCAGR = currentCAGR * (1 + yearlyCAGRChange);
              currentVolatility =
                currentVolatility * (1 + yearlyVolatilityChange);
              currentWithdrawal =
                currentWithdrawal * (1 + yearlyWithdrawalChange);
              currentDeposit = currentDeposit * (1 + yearlyDepositChange);
            }
            simulationResults.push(data);
            finalBalances.push(currentBalance);
            simulationCAGRs.push(
              Math.pow(currentBalance / initialBalance, 1 / years) - 1
            );
            rainyDayFinals.push(0);
          }
          // Count negative effective CAGR years (excluding year 0)
          var negativeCount = 0;
          for (var j = 1; j < data.length; j++) {
            if (data[j].effectiveCAGR < 0) {
              negativeCount++;
            }
          }
          negativeYearsArray.push(negativeCount);
        }

        var sumBalance = finalBalances.reduce((a, b) => a + b, 0);
        var avgBalance = sumBalance / finalBalances.length;
        var minBalance = Math.min(...finalBalances);
        var maxBalance = Math.max(...finalBalances);

        var sumCAGR = simulationCAGRs.reduce((a, b) => a + b, 0);
        var avgCAGR = sumCAGR / simulationCAGRs.length;
        var minOverallCAGR = Math.min(...simulationCAGRs);
        var maxOverallCAGR = Math.max(...simulationCAGRs);

        var variance =
          finalBalances.reduce(
            (sum, balance) => sum + Math.pow(balance - avgBalance, 2),
            0
          ) / finalBalances.length;
        var stdDev = Math.sqrt(variance);
        var relativeStdDev = (stdDev / avgBalance) * 100;

        var sumRainy = rainyDayFinals.reduce((a, b) => a + b, 0);
        var avgRainy = sumRainy / rainyDayFinals.length;
        var minRainy = Math.min(...rainyDayFinals);
        var maxRainy = Math.max(...rainyDayFinals);

        var sumNegYears = negativeYearsArray.reduce((a, b) => a + b, 0);
        var avgNegYears = sumNegYears / negativeYearsArray.length;
        var percentNegYears = (avgNegYears / years) * 100;

        // Calculate medians.
        var medianFinalBalance = median(finalBalances);
        var medianOverallCAGR = median(simulationCAGRs);
        var medianRainyDayFund = median(rainyDayFinals);
        var medianNegYears = median(negativeYearsArray);
        var medianNegYearsPercent = (medianNegYears / years) * 100;

        displaySummary({
          simulations: numSimulations,
          avgBalance: avgBalance,
          minBalance: minBalance,
          maxBalance: maxBalance,
          medianBalance: medianFinalBalance,
          avgCAGR: avgCAGR,
          minOverallCAGR: minOverallCAGR,
          maxOverallCAGR: maxOverallCAGR,
          medianOverallCAGR: medianOverallCAGR,
          relativeStdDev: relativeStdDev,
          rainyDayAvg: avgRainy,
          rainyDayMin: minRainy,
          rainyDayMax: maxRainy,
          medianRainyDayFund: medianRainyDayFund,
          avgNegYears: avgNegYears,
          percentNegYears: percentNegYears,
          medianNegYears: medianNegYears,
          medianNegYearsPercent: medianNegYearsPercent,
        });

        displayTable(simulationResults[0]);

        var maxIndex = finalBalances.indexOf(maxBalance);
        var minIndex = finalBalances.indexOf(minBalance);
        var avgIndex = 0;
        var minDiff = Infinity;
        for (var i = 0; i < finalBalances.length; i++) {
          var diff = Math.abs(finalBalances[i] - avgBalance);
          if (diff < minDiff) {
            minDiff = diff;
            avgIndex = i;
          }
        }
        var selectedSimulations = [
          simulationResults[maxIndex],
          simulationResults[minIndex],
          simulationResults[avgIndex],
        ];

        drawGraph(selectedSimulations);
        drawBarGraph(avgBalance, minBalance, maxBalance, medianFinalBalance);
        drawSortedGraph(finalBalances);
      }

      function displaySummary(summary) {
        var tableHTML = "";
        tableHTML +=
          "<tr><th title='Total number of simulation runs performed. Each simulation represents a possible scenario under varying market conditions.'>Simulations</th><td>" +
          summary.simulations +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Average final portfolio balance across all simulations. This value provides an overall estimate of your portfolio’s potential end-of-period wealth.'>Avg Final Balance</th><td>$" +
          formatCurrency(summary.avgBalance, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Median final portfolio balance; less affected by extreme values than the average.'>Median Final Balance</th><td>$" +
          formatCurrency(summary.medianBalance, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='25% below the median final balance, indicating the lower boundary of a likely outcome range.'>Lower 25% Range (Median - 25%)</th><td>$" +
          formatCurrency(summary.medianBalance * 0.75, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='25% above the median final balance, indicating the upper boundary of a likely outcome range.'>Upper 25% Range (Median + 25%)</th><td>$" +
          formatCurrency(summary.medianBalance * 1.25, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='The worst-case scenario final portfolio balance observed.'>Min Final Balance</th><td>$" +
          formatCurrency(summary.minBalance, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='The best-case scenario final portfolio balance observed.'>Max Final Balance</th><td>$" +
          formatCurrency(summary.maxBalance, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Average overall compound annual growth rate (CAGR) derived from the simulations.'>Avg Overall CAGR</th><td>" +
          (summary.avgCAGR * 100).toFixed(2) +
          "%</td></tr>";
        tableHTML +=
          "<tr><th title='Median overall CAGR from the simulations.'>Median Overall CAGR</th><td>" +
          (summary.medianOverallCAGR * 100).toFixed(2) +
          "%</td></tr>";
        tableHTML +=
          "<tr><th title='The worst-case overall CAGR observed.'>Min Overall CAGR</th><td>" +
          (summary.minOverallCAGR * 100).toFixed(2) +
          "%</td></tr>";
        tableHTML +=
          "<tr><th title='The best-case overall CAGR observed.'>Max Overall CAGR</th><td>" +
          (summary.maxOverallCAGR * 100).toFixed(2) +
          "%</td></tr>";
        tableHTML +=
          "<tr><th title='Relative standard deviation of final balances, a measure of variability and risk.'>Balance Rel Std Dev</th><td>" +
          summary.relativeStdDev.toFixed(2) +
          "%</td></tr>";
        tableHTML +=
          "<tr><th title='Average final balance of the Rainy Day Fund across simulations.'>Avg Rainy Day Fund</th><td>$" +
          formatCurrency(summary.rainyDayAvg, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Median final balance of the Rainy Day Fund.'>Median Rainy Day Fund</th><td>$" +
          formatCurrency(summary.medianRainyDayFund, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Worst-case final balance of the Rainy Day Fund.'>Min Rainy Day Fund</th><td>$" +
          formatCurrency(summary.rainyDayMin, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Best-case final balance of the Rainy Day Fund.'>Max Rainy Day Fund</th><td>$" +
          formatCurrency(summary.rainyDayMax, 2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Average number of years with negative CAGR, indicating periods of decline.'>Avg Negative Years</th><td>" +
          summary.avgNegYears.toFixed(2) +
          "</td></tr>";
        tableHTML +=
          "<tr><th title='Average negative years as a percentage of total duration.'>Avg Negative Years (% of Total)</th><td>" +
          summary.percentNegYears.toFixed(2) +
          "%</td></tr>";
        document.querySelector("#summaryTableWrapper table").innerHTML =
          tableHTML;
      }

      function displayTable(data) {
        var container = document.getElementById("tableContainer");
        var includeRainyDayFund =
          data.length > 0 && data[0].hasOwnProperty("rainyDayFund");
        var html = "<h2>Detailed Year-by-Year Results (First Simulation)</h2>";
        html += '<table id="resultsTable">';
        html += "<thead><tr>";
        html += "<th>Year</th>";
        html += "<th>Balance ($)</th>";
        if (includeRainyDayFund) {
          html += "<th>Rainy Day Fund ($)</th>";
        }
        html += "<th>Effective CAGR (%)</th>";
        html += "<th>CAGR Used (%)</th>";
        html += "<th>Random Adj. (%)</th>";
        html += "<th>Volatility Used (%)</th>";
        html += "<th>Monthly Withdrawal Applied ($)</th>";
        html += "<th>Monthly Deposit Applied ($)</th>";
        html += "</tr></thead>";
        html += "<tbody>";

        data.forEach(function (entry) {
          var effectiveCAGRText =
            entry.year === 0 ? "-" : (entry.effectiveCAGR * 100).toFixed(2);
          var cagrUsedText =
            entry.year === 0 ? "-" : (entry.cagrUsed * 100).toFixed(2);
          var randomAdjText =
            entry.year === 0 ? "-" : (entry.randomAdjustment * 100).toFixed(2);
          var volatilityText = (entry.volatility * 100).toFixed(2);
          html += "<tr>";
          html += "<td>" + entry.year + "</td>";
          html += "<td>$" + formatCurrency(entry.balance, 2) + "</td>";
          if (includeRainyDayFund) {
            html += "<td>$" + formatCurrency(entry.rainyDayFund, 2) + "</td>";
          }
          html += "<td>" + effectiveCAGRText + "</td>";
          html += "<td>" + cagrUsedText + "</td>";
          html += "<td>" + randomAdjText + "</td>";
          html += "<td>" + volatilityText + "</td>";
          html +=
            "<td>$" + formatCurrency(entry.withdrawalApplied, 2) + "</td>";
          html +=
            "<td>$" + formatCurrency(entry.depositApplied || 0, 2) + "</td>";
          html += "</tr>";
        });

        html += "</tbody></table>";
        container.innerHTML = html;
      }

      function drawGraph(simulationResults) {
        var canvas = document.getElementById("graph");
        var ctx = canvas.getContext("2d");
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        var margin = { top: 20, right: 60, bottom: 50, left: 60 };
        var graphWidth = canvas.width - margin.left - margin.right;
        var graphHeight = canvas.height - margin.top - margin.bottom;

        var maxBalance = 0;
        simulationResults.forEach(function (simData) {
          var simMax = Math.max(...simData.map((point) => point.balance));
          if (simMax > maxBalance) {
            maxBalance = simMax;
          }
        });
        maxBalance *= 1.1;

        var totalYears =
          simulationResults[0][simulationResults[0].length - 1].year;
        var numXTicks = totalYears <= 10 ? totalYears + 1 : 10;

        var xScale = function (year) {
          return margin.left + (year / totalYears) * graphWidth;
        };
        var yScale = function (balance) {
          return (
            margin.top + graphHeight - (balance / maxBalance) * graphHeight
          );
        };

        ctx.beginPath();
        ctx.strokeStyle = "#000";
        ctx.lineWidth = 1;
        ctx.moveTo(margin.left, margin.top);
        ctx.lineTo(margin.left, margin.top + graphHeight);
        ctx.lineTo(margin.left + graphWidth, margin.top + graphHeight);
        ctx.stroke();

        // X-axis tick labels (14px)
        ctx.textAlign = "center";
        ctx.textBaseline = "top";
        ctx.font = "14px Arial";
        for (var i = 0; i < numXTicks; i++) {
          var year = Math.round((i * totalYears) / (numXTicks - 1));
          var x = xScale(year);
          ctx.beginPath();
          ctx.moveTo(x, margin.top + graphHeight);
          ctx.lineTo(x, margin.top + graphHeight + 5);
          ctx.stroke();
          ctx.fillText(year, x, margin.top + graphHeight + 5);
        }
        // Y-axis tick labels (14px)
        ctx.textAlign = "right";
        ctx.textBaseline = "middle";
        ctx.font = "14px Arial";
        var numYTicks = 6;
        for (var i = 0; i < numYTicks; i++) {
          var balanceTick = (maxBalance * i) / (numYTicks - 1);
          var y = yScale(balanceTick);
          ctx.beginPath();
          ctx.moveTo(margin.left - 5, y);
          ctx.lineTo(margin.left, y);
          ctx.stroke();
          ctx.fillText(
            "$" + formatCurrency(balanceTick, 0),
            margin.left - 7,
            y
          );
        }

        // Draw curves (final point labels in 17px)
        ctx.font = "17px Arial";
        var colors = ["#66CC66", "#FF6666", "#FFA500"];
        var curveLabels = ["Max", "Min", "Avg"];
        simulationResults.forEach(function (simData, idx) {
          ctx.beginPath();
          ctx.strokeStyle = colors[idx];
          ctx.lineWidth = 2;
          simData.forEach(function (point, index) {
            var x = xScale(point.year);
            var y = yScale(point.balance);
            if (index === 0) {
              ctx.moveTo(x, y);
            } else {
              ctx.lineTo(x, y);
            }
          });
          ctx.stroke();
          var lastPoint = simData[simData.length - 1];
          var labelX = xScale(lastPoint.year) + 5;
          var labelY = yScale(lastPoint.balance);
          ctx.fillStyle = colors[idx];
          ctx.fillText(curveLabels[idx], labelX, labelY);
        });

        // Axis labels (20px) – place Y-axis title inside the graph above Y-axis.
        ctx.fillStyle = "#000";
        ctx.font = "20px Arial";
        ctx.textAlign = "center";
        ctx.textBaseline = "bottom";
        ctx.fillText("Year", margin.left + graphWidth / 2, canvas.height - 5);
        ctx.textAlign = "left";
        ctx.textBaseline = "top";
        ctx.fillText("Balance ($)", margin.left + 10, margin.top + 10);
      }

      // Updated drawBarGraph to include only four bars (Min, Median, Max, Avg)
      // and to display abbreviated numbers.
      function drawBarGraph(avg, min, max, median) {
        var canvas = document.getElementById("barGraph");
        if (!canvas) return;
        var ctx = canvas.getContext("2d");
        canvas.width = 600;
        canvas.height = 450;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        var baseMargin = { left: 50, right: 30, top: 50, bottom: 50 };
        var W = canvas.width,
          H = canvas.height;
        var totalHorizontal = baseMargin.left + baseMargin.right;
        var totalVertical = baseMargin.top + baseMargin.bottom;
        var extraHorizontal = 0.075 * (W - totalHorizontal);
        var extraVertical = 0.075 * (H - totalVertical);
        var margin = {
          left: baseMargin.left + extraHorizontal,
          right: baseMargin.right + extraHorizontal,
          top: baseMargin.top + extraVertical,
          bottom: baseMargin.bottom + extraVertical,
        };

        var availableWidth = canvas.width - margin.left - margin.right;
        var availableHeight = canvas.height - margin.top - margin.bottom;

        // Define only 4 bars: Min, Median, Max, Avg.
        var data = [
          { label: "Min", value: min },
          { label: "Median", value: median },
          { label: "Max", value: max },
          { label: "Avg", value: avg },
        ];

        var numBars = data.length;
        var gap = 10;
        var barWidth = (availableWidth - gap * (numBars - 1)) / numBars;
        var scaleMax = Math.max(avg, min, max, median);
        if (scaleMax === 0) {
          scaleMax = 1;
        }

        ctx.beginPath();
        ctx.strokeStyle = "#000";
        ctx.lineWidth = 1;
        ctx.moveTo(margin.left, margin.top);
        ctx.lineTo(margin.left, margin.top + availableHeight);
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(margin.left, margin.top + availableHeight);
        ctx.lineTo(margin.left + availableWidth, margin.top + availableHeight);
        ctx.stroke();

        // Y-axis tick labels with 22px font.
        ctx.textAlign = "right";
        ctx.textBaseline = "middle";
        ctx.font = "22px Arial";
        var numYTicks = 5;
        for (var i = 0; i < numYTicks; i++) {
          var yValue = (scaleMax * i) / (numYTicks - 1);
          var yPos =
            margin.top +
            availableHeight -
            (yValue / scaleMax) * availableHeight;
          ctx.beginPath();
          ctx.moveTo(margin.left - 5, yPos);
          ctx.lineTo(margin.left, yPos);
          ctx.stroke();
          ctx.fillText("$" + abbreviateNumber(yValue), margin.left - 7, yPos);
        }

        // Bar value labels in 20px font, drawn just above each bar.
        ctx.font = "20px Arial";
        data.forEach(function (item, index) {
          var barHeight = (item.value / scaleMax) * availableHeight;
          var x = margin.left + index * (barWidth + gap);
          var y = margin.top + availableHeight - barHeight;
          ctx.fillStyle = "#0077cc";
          ctx.fillRect(x, y, barWidth, barHeight);
          ctx.fillStyle = "#000";
          ctx.textAlign = "center";
          ctx.fillText(
            "$" + abbreviateNumber(item.value),
            x + barWidth / 2,
            y - 5
          );
          // Place the category label 30px above the bar top.
          var labelY = Math.max(y - 30, margin.top + 5);
          ctx.fillText(item.label, x + barWidth / 2, labelY);
        });
      }

      function drawSortedGraph(finalBalances) {
        var canvas = document.getElementById("sortedGraph");
        if (!canvas) return;
        var ctx = canvas.getContext("2d");
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        var margin = { left: 50, right: 30, top: 50, bottom: 50 };
        var W = canvas.width,
          H = canvas.height;
        var totalHorizontal = margin.left + margin.right;
        var totalVertical = margin.top + margin.bottom;
        var extraHorizontal = 0.075 * (W - totalHorizontal);
        var extraVertical = 0.075 * (H - totalVertical);
        var newMargin = {
          left: margin.left + extraHorizontal,
          right: margin.right + extraHorizontal,
          top: margin.top + extraVertical,
          bottom: margin.bottom + extraVertical,
        };

        var availableWidth = canvas.width - newMargin.left - newMargin.right;
        var availableHeight = canvas.height - newMargin.top - newMargin.bottom;

        var sortedBalances = finalBalances.slice().sort(function (a, b) {
          return b - a;
        });
        var numBars = sortedBalances.length;
        var gap = 1;
        var barWidth = (availableWidth - gap * (numBars + 1)) / numBars;
        var maxValue = Math.max(...sortedBalances);
        if (maxValue === 0) {
          maxValue = 1;
        }

        ctx.beginPath();
        ctx.strokeStyle = "#000";
        ctx.lineWidth = 1;
        ctx.moveTo(newMargin.left, newMargin.top);
        ctx.lineTo(newMargin.left, newMargin.top + availableHeight);
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(newMargin.left, newMargin.top + availableHeight);
        ctx.lineTo(
          newMargin.left + availableWidth,
          newMargin.top + availableHeight
        );
        ctx.stroke();

        var numYTicks = 5;
        ctx.textAlign = "right";
        ctx.textBaseline = "middle";
        ctx.font = "8px Arial";
        for (var i = 0; i < numYTicks; i++) {
          var yValue = (maxValue * i) / (numYTicks - 1);
          var yPos =
            newMargin.top +
            availableHeight -
            (yValue / maxValue) * availableHeight;
          ctx.beginPath();
          ctx.moveTo(newMargin.left - 5, yPos);
          ctx.lineTo(newMargin.left, yPos);
          ctx.stroke();
          ctx.fillText(
            "$" + formatCurrency(yValue, 0),
            newMargin.left - 7,
            yPos
          );
        }

        sortedBalances.forEach(function (value, index) {
          var barHeight = (value / maxValue) * availableHeight;
          var x = newMargin.left + index * (barWidth + gap);
          var y = newMargin.top + availableHeight - barHeight;
          ctx.fillStyle = "#0077cc";
          ctx.fillRect(x, y, barWidth, barHeight);
        });

        ctx.strokeStyle = "#000";
        ctx.beginPath();
        ctx.moveTo(newMargin.left, newMargin.top + availableHeight);
        ctx.lineTo(
          newMargin.left + availableWidth,
          newMargin.top + availableHeight
        );
        ctx.stroke();
      }

      document
        .getElementById("simulateButton")
        .addEventListener("click", simulateInvestment);
    </script>
  </body>
</html>
